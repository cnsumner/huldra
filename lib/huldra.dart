// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:drift/native.dart';
import 'package:huldra/extensions/word_extensions.dart';
import 'package:huldra/markov/markov.dart';
import 'package:huldra/schema/knowledge_base.dart';
import 'package:huldra/schema/raw_data.dart' as tables;
import 'package:injector/injector.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx_extensions/nyxx_extensions.dart';

class Huldra {
  NyxxGateway bot;
  int probability;
  int ownerId;

  Huldra(this.bot, this.probability, this.ownerId) {
    final kb = Injector.appInstance.get<KnowledgeBase>();

    bot.onMessageCreate.listen((e) async {
      // ignore bot messages and empty messages
      final author = await e.member?.get();
      if (author?.user?.isBot == true ||
          (e.message.content.isEmpty && e.message.attachments.isEmpty)) {
        print('Ignoring bot or empty message: ${e.message.id.value}');
      }
      // process commands
      else if (e.message.content.startsWith('_') && !e.message.content.startsWith('__')) {
        await _processCommands(e);
      }
      // process bot mentions
      else if (e.message.mentions
          .where((mention) => mention.id.compareTo(bot.user.id) == 0)
          .isNotEmpty) {
        final guildChannel = (await e.message.channel.get()) as GuildChannel;
        final effectivePermissions = await guildChannel.computePermissionsFor(
          await guildChannel.guild.members.get(bot.user.id),
        );

        if (effectivePermissions.canSendMessages == false) {
          print('Cannot send message in channel ${e.message.channelId} due to permissions');
          return;
        }
        await e.message.channel.triggerTyping();

        await _addMessage(e.message, e.guild?.id)
            .whenComplete(() async {
              final input = e.message.content.split(' ')
                ..removeAt(0)
                ..removeWhere((word) => word == '');

              final reply = await generateNonDuplicate(input, input.join(' ').trim());

              await Future.delayed(
                Duration(milliseconds: 100 * reply.split(' ').length.clamp(5, 100)),
              );

              await e.message.channel.sendMessage(MessageBuilder(content: reply));
              print('sent $reply');
            })
            .catchError((error) {
              print(error);
              return false;
            });
      }
      // default case. respond normally
      else {
        final rand = Random(DateTime.now().millisecondsSinceEpoch);
        final willReply = (rand.nextInt(probability) + 1) == probability;

        if (willReply) {
          final guildChannel = (await e.message.channel.get()) as GuildChannel;
          final effectivePermissions = await guildChannel.computePermissionsFor(
            await guildChannel.guild.members.get(bot.user.id),
          );

          if (effectivePermissions.canSendMessages == false) {
            print('Cannot send message in channel ${e.message.channelId} due to permissions');
            return;
          }

          await e.message.channel.triggerTyping();
        }

        await _addMessage(e.message, e.guild?.id).whenComplete(() async {
          if (willReply) {
            final reply = (await generateNonDuplicate(
              e.message.content.split(' ')..removeWhere((word) => word == ''),
              e.message.content,
            )).trim();

            await Future.delayed(
              Duration(milliseconds: 100 * reply.split(' ').length.clamp(5, 100)),
            );

            try {
              await e.message.channel.sendMessage(MessageBuilder(content: reply));
              print('sent $reply');
            } catch (error) {
              print(
                '[${DateTime.now().toUtc().toIso8601String()}]: Encountered error [$error] while sending response to message [${e.message.id}] in channel [${e.message.channelId}]',
              );
            }
          }
        });
      }
    });

    bot.onReady.listen((_) {
      Logger("Huldra").info('Huldra is awake...');
    });

    kb.getMetadata().then(
      (value) => Logger("Huldra").info('Metadata loaded with ${value.wordCount} words.'),
    );
    kb.countWords().getSingle().then(
      (value) => Logger("Huldra").info('Knowledgebase loaded with $value words.'),
    );
  }

  Future<bool> _addMessage(Message m, Snowflake? guildId, {bool printDebugLogs = true}) async {
    if (guildId == null) {
      Logger(
        "Huldra",
      ).warning(
        "Skipping message ${m.id}: guild is null. this probably shouldn't happen or be possible...",
      );
      return false;
    }

    final message = tables.Message(
      id: m.id.toString(),
      guild: guildId.toString(),
      channel: m.channel.id.toString(),
      author: m.author.id.toString(),
      timestamp: m.timestamp,
      content: m.content,
    );

    final attachments = <tables.Attachment>[];

    attachments.addAll(
      m.attachments.map(
        (attachment) => tables.Attachment(
          id: attachment.id.toString(),
          guild: guildId.toString(),
          channel: m.channel.id.toString(),
          url: attachment.url.toString(),
          filename: attachment.fileName,
        ),
      ),
    );

    final messageAttachments = <tables.MessageAttachment>[];

    messageAttachments.addAll(
      attachments.map(
        (attachment) =>
            tables.MessageAttachment(attachmentId: attachment.id, messageId: message.id),
      ),
    );

    var error = false;

    await Injector.appInstance
        .get<tables.RawData>()
        .insertMessage(message, attachments, messageAttachments)
        .then(
          (result) {
            _printLogIf('Added message ${message.id} to db...', printDebugLogs);
          },
          onError: (e) {
            if (e.runtimeType == SqliteException &&
                (e as SqliteException).message.contains('UNIQUE constraint failed: messages.id')) {
              _printLogIf('Skipping message already in db', printDebugLogs);
            } else {
              Logger("Huldra").warning('Failed to add message to db: $e');
            }
            error = true;
          },
        );

    if (error) {
      return false;
    } else {
      await Markov.train(
        message.content.replaceFirst(RegExp('<@!?${bot.user.id}>'), '').split(' ')
          ..removeWhere((word) => word == '' || word == ' '),
      );

      return true;
    }
  }

  Future<int> _addMessages(List<Message> messages, Snowflake guildId) async {
    final initialCount = messages.length;

    // remove bot messages
    messages.removeWhere((m) => m.author is User && (m.author as User).isBot);

    _printLogIf(
      'Skipping ${initialCount - messages.length} bot messages...',
      initialCount - messages.length > 0,
    );

    final dbMessages = messages
        .map(
          (m) => tables.Message(
            id: m.id.toString(),
            guild: guildId.toString(),
            channel: m.channel.id.toString(),
            author: m.author.id.toString(),
            timestamp: m.timestamp,
            content: m.content,
          ),
        )
        .toList();

    final dbAttachments = <tables.Attachment>[];
    final dbMessageAttachments = <tables.MessageAttachment>[];

    for (final m in messages) {
      for (final attachment in m.attachments) {
        dbAttachments.add(
          tables.Attachment(
            id: attachment.id.toString(),
            guild: guildId.toString(),
            channel: m.channel.id.toString(),
            url: attachment.url.toString(),
            filename: attachment.fileName,
          ),
        );
        dbMessageAttachments.add(
          tables.MessageAttachment(
            attachmentId: attachment.id.toString(),
            messageId: m.id.toString(),
          ),
        );
      }
    }

    return await Injector.appInstance.get<tables.RawData>().insertMessages(
      dbMessages,
      dbAttachments,
      dbMessageAttachments,
    );
  }

  Future<void> _processCommands(MessageCreateEvent e) async {
    if (e.message.content.toLowerCase().startsWith('_fetch') &&
        e.message.author.id.value == ownerId) {
      final arguments = e.message.content.split(' ')..removeAt(0);
      if (arguments.isNotEmpty && e.guild != null) {
        _fetchMessages(e.guild!.id, Snowflake.parse(arguments[0]));
      } else {
        await e.message.channel.sendMessage(
          MessageBuilder(content: 'Invalid arguments or no guild'),
        );
      }
    } else if (e.message.content.toLowerCase().startsWith('_trainall') &&
        e.message.author.id.value == ownerId) {
      _trainAll();
    } else if (e.message.content.toLowerCase().startsWith('_exportcorpus') &&
        e.message.author.id.value == ownerId) {
      _exportCorpus();
    } else if (e.message.content.toLowerCase().startsWith('_query')) {
      final arguments = e.message.content.split(' ')..removeAt(0);
      if (arguments.isNotEmpty && arguments.length == 1) {
        await _query(arguments[0]).then((value) async {
          await e.message.channel.sendMessage(MessageBuilder(content: value));
        });
      } else {
        await e.message.channel.sendMessage(
          MessageBuilder(content: 'Word not specified. Usage: _query [word]'),
        );
      }
    }
  }

  Future<void> _fetchMessages(Snowflake guildId, Snowflake startId) async {
    print('Fetching messages after $startId');

    final guild = await bot.guilds.get(guildId);

    final botMember = await guild.members.get(bot.user.id);

    final channels = (await guild.fetchChannels()).where((channel) => _channelTypeValid(channel));

    var totalCountAdded = 0;
    var totalCountFetched = 0;

    for (final channel in channels) {
      final effectivePermissions = await channel.computePermissionsFor(botMember);

      if (!effectivePermissions.canViewChannel || !effectivePermissions.canReadMessageHistory) {
        print('Skipping channel [${channel.name}]: no read permission');
        continue;
      }

      var channelCountAdded = 0;
      var channelCountFetched = 0;

      final messageBuffer = <Message>[];

      final messagesStream = (channel as TextChannel).messages.stream(after: startId);

      final streamIter = StreamIterator<Message>(messagesStream);

      while (await streamIter.moveNext()) {
        final message = streamIter.current;

        messageBuffer.add(message);

        if (messageBuffer.length >= 1000) {
          print('Buffer full, writing 1k messages to db...');

          channelCountFetched += messageBuffer.length;
          totalCountFetched += messageBuffer.length;

          _printLogIf(
            'Fetched $totalCountFetched messages so far, up to ${messageBuffer.last.createdAt}...',
            totalCountFetched > 0,
          );

          final results = await _addMessages(messageBuffer, guild.id);

          print('Wrote $results messages to database');

          totalCountAdded += results;
          channelCountAdded += results;
          messageBuffer.clear();
        }
      }

      // write remaining messages in buffer
      if (messageBuffer.isNotEmpty) {
        channelCountFetched += messageBuffer.length;
        totalCountFetched += messageBuffer.length;

        final results = await _addMessages(messageBuffer, guild.id);
        _printLogIf('Wrote $results messages to database', results > 0);

        totalCountAdded += results;
        channelCountAdded += results;
      }

      print(
        '${channelCountFetched > 0 ? 'Added $channelCountAdded out of $channelCountFetched messages' : 'No messages added'} from channel ${channel.name}',
      );
    }

    print(
      'Added $totalCountAdded out of $totalCountFetched messages from ${channels.length} channels. Run `_trainAll` to sync the knowledgebase',
    );
  }

  Future<void> _trainAll() async {
    final kb = Injector.appInstance.get<KnowledgeBase>();
    await kb.clearKnowledgeBase();

    var count = 0;
    var pageSize = 1000;
    var messages = await Injector.appInstance.get<tables.RawData>().getPagedMessages(pageSize);

    final stopwatch = Stopwatch();
    final totalStopwatch = Stopwatch()..start();
    double? lastFreq;
    var performanceBias = 0;
    var direction = 1;

    // Get total message count for progress bar
    final totalMessages = await Injector.appInstance
        .get<tables.RawData>()
        .managers
        .messages
        .count();

    while (messages.isNotEmpty) {
      stopwatch.reset();
      stopwatch.start();

      for (final message in messages) {
        final sanitizedMessage = message.content
            .replaceFirst(RegExp('<@!?${bot.user.id}>'), '')
            .trim();
        final tokens = sanitizedMessage.split(' ')
          ..removeWhere((token) => token == '' || token == ' ');

        await Markov.train(tokens);
      }

      count += messages.length;
      final msgCount = messages.length;

      messages = await Injector.appInstance.get<tables.RawData>().getPagedMessages(
        pageSize,
        lastId: messages.last.id,
      );

      stopwatch.stop();

      final freq =
          msgCount / (stopwatch.elapsedMilliseconds > 0 ? stopwatch.elapsedMilliseconds : 1);

      // --- Unicode Block Progress Bar ---
      final percent = (count / totalMessages).clamp(0, 1);
      const barLength = 40;
      final filledLength = (barLength * percent).round();
      final bar = '█' * filledLength + '-' * (barLength - filledLength);
      final percentDisplay = (percent * 100).toStringAsFixed(1).padLeft(5);

      // --- ETA Calculation ---
      final elapsed = totalStopwatch.elapsed.inSeconds;
      final avgSpeed = elapsed > 0 ? count / elapsed : 0;
      final remaining = totalMessages - count;
      final etaSeconds = avgSpeed > 0 ? (remaining / avgSpeed).round() : 0;
      final etaH = (etaSeconds ~/ 3600).toString().padLeft(2, '0');
      final etaM = ((etaSeconds % 3600) ~/ 60).toString().padLeft(2, '0');
      final etaS = (etaSeconds % 60).toString().padLeft(2, '0');
      final etaDisplay = '$etaH:$etaM:$etaS';

      // Print progress bar (first line)
      stdout.write('\r$bar $percentDisplay%'.padRight(60));
      // Print states (second line)
      stdout.write(
        '\nSpeed: ${(freq * 1000).toStringAsFixed(2)} msgs/s | $count/$totalMessages messages | Page size: $pageSize | ETA: $etaDisplay'
            .padRight(80),
      );
      // Move cursor up one line to keep overwriting the same two lines
      stdout.write('\x1B[1A');

      if (lastFreq == null) {
        lastFreq = freq;
        continue;
      } else {
        if (lastFreq > freq) {
          performanceBias -= performanceBias > -10 ? 1 : 0;
        } else if (lastFreq < freq) {
          performanceBias += performanceBias < 2 ? 2 : 0;
        }

        if (performanceBias.abs() > 3) {
          direction = performanceBias.sign == 0 ? 1 : performanceBias.sign;
          performanceBias = 0;
        }

        if ((pageSize < 2000 && direction > 0) || (pageSize > 100 && direction < 0)) {
          pageSize += 100 * direction;
        }

        lastFreq = freq;
      }
    }

    totalStopwatch.stop();

    // Print newline after progress bar is done
    stdout.write('\n');

    await kb.getMetadata().then(
      (value) => print(
        'Trained on \u001b[1m${value.wordCount}\u001b[0m words from \u001b[1m${value.msgCount}\u001b[0m messages',
      ),
    );

    await kb.countWords().getSingle().then((value) => print('Kb now contains $value words'));
  }

  Future<void> _exportCorpus() async {
    final corpusFile = File('corpus.txt');
    final sink = corpusFile.openWrite(mode: FileMode.writeOnly);

    final rawData = Injector.appInstance.get<tables.RawData>();

    var messages = await rawData.getPagedMessages(1000);

    String? prevSanitized;

    while (messages.isNotEmpty) {
      for (final message in messages) {
        final sanitized = message.content
            // remove excessive punctuation
            .replaceAll(RegExp(r'([!?.])\1{1,}'), r'\1')
            // remove special characters except for some allowed ones
            .replaceAll(
              RegExp(r'[^\w\s<@&!:\/\.\u{1F300}-\u{1FAFF}\u{2600}-\u{26FF}]', unicode: true),
              '',
            )
            // remove excessive whitespace
            .replaceAll(RegExp(r'\s+'), ' ')
            .trim();

        if (sanitized.isEmpty) {
          _printLogIf('Skipping empty message ${message.id}', true);
          continue;
        }

        if (prevSanitized != null && prevSanitized.isNotEmpty) {
          sink.writeln('$prevSanitized $sanitized ____END_OF_DOCUMENT____');
        } else {
          // If there's no previous message, just write the current one
          sink.writeln(sanitized);
        }
        prevSanitized = sanitized;
      }

      messages = await rawData.getPagedMessages(1000, lastId: messages.last.id);
    }

    await sink.flush();
    await sink.close();

    Logger("Huldra").info('Corpus file written to ${corpusFile.path}');
  }

  Future<String> _query(String word) async {
    final kb = Injector.appInstance.get<KnowledgeBase>();

    final words = await kb.queryWords(word);

    final results = await Future.wait(
      words.map<Future<String>>((word) {
        return word.toFormattedString();
      }),
    );

    final formattedResults = results.join();

    return 'Results: $formattedResults';
  }

  bool _channelTypeValid(Channel channel) {
    return <ChannelType>[
      ChannelType.guildText,
      ChannelType.publicThread,
      ChannelType.privateThread,
    ].contains(channel.type);
  }

  void _printLogIf(String message, bool shouldLog) {
    if (shouldLog) {
      Logger("Huldra").info(message);
    }
  }

  Future<String> generateNonDuplicate(List<String> tokens, String original) async {
    var output = await Markov.generate(tokens);

    // if the output is the same as the input, try again a few times
    for (var i = 0; i < 2; i++) {
      if (output.trim().compareTo(original.trim()) == 0) {
        Logger("Huldra").info('Duplicate message generated, retrying...');
        output = await Markov.generate(tokens);
      } else {
        break;
      }
    }

    if (output.trim().compareTo(original.trim()) == 0) {
      final rand = Random(DateTime.now().millisecondsSinceEpoch);
      output = rand.nextInt(2) == 0 ? output : (await Markov.generate([]));
    }

    return output.replaceAll(RegExp('<@!?${bot.user.id}>'), '').trim();
  }
}
