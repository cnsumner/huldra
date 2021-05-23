// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raw_data.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Message extends DataClass implements Insertable<Message> {
  final String id;
  final String author;
  final String guild;
  final String channel;
  final String content;
  final DateTime timestamp;
  Message(
      {required this.id,
      required this.author,
      required this.guild,
      required this.channel,
      required this.content,
      required this.timestamp});
  factory Message.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Message(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      author: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author'])!,
      guild: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}guild'])!,
      channel: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}channel'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      timestamp: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}timestamp'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['author'] = Variable<String>(author);
    map['guild'] = Variable<String>(guild);
    map['channel'] = Variable<String>(channel);
    map['content'] = Variable<String>(content);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  MessagesCompanion toCompanion(bool nullToAbsent) {
    return MessagesCompanion(
      id: Value(id),
      author: Value(author),
      guild: Value(guild),
      channel: Value(channel),
      content: Value(content),
      timestamp: Value(timestamp),
    );
  }

  factory Message.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Message(
      id: serializer.fromJson<String>(json['id']),
      author: serializer.fromJson<String>(json['author']),
      guild: serializer.fromJson<String>(json['guild']),
      channel: serializer.fromJson<String>(json['channel']),
      content: serializer.fromJson<String>(json['content']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'author': serializer.toJson<String>(author),
      'guild': serializer.toJson<String>(guild),
      'channel': serializer.toJson<String>(channel),
      'content': serializer.toJson<String>(content),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  Message copyWith(
          {String? id,
          String? author,
          String? guild,
          String? channel,
          String? content,
          DateTime? timestamp}) =>
      Message(
        id: id ?? this.id,
        author: author ?? this.author,
        guild: guild ?? this.guild,
        channel: channel ?? this.channel,
        content: content ?? this.content,
        timestamp: timestamp ?? this.timestamp,
      );
  @override
  String toString() {
    return (StringBuffer('Message(')
          ..write('id: $id, ')
          ..write('author: $author, ')
          ..write('guild: $guild, ')
          ..write('channel: $channel, ')
          ..write('content: $content, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          author.hashCode,
          $mrjc(
              guild.hashCode,
              $mrjc(channel.hashCode,
                  $mrjc(content.hashCode, timestamp.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Message &&
          other.id == this.id &&
          other.author == this.author &&
          other.guild == this.guild &&
          other.channel == this.channel &&
          other.content == this.content &&
          other.timestamp == this.timestamp);
}

class MessagesCompanion extends UpdateCompanion<Message> {
  final Value<String> id;
  final Value<String> author;
  final Value<String> guild;
  final Value<String> channel;
  final Value<String> content;
  final Value<DateTime> timestamp;
  const MessagesCompanion({
    this.id = const Value.absent(),
    this.author = const Value.absent(),
    this.guild = const Value.absent(),
    this.channel = const Value.absent(),
    this.content = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  MessagesCompanion.insert({
    required String id,
    required String author,
    required String guild,
    required String channel,
    required String content,
    required DateTime timestamp,
  })  : id = Value(id),
        author = Value(author),
        guild = Value(guild),
        channel = Value(channel),
        content = Value(content),
        timestamp = Value(timestamp);
  static Insertable<Message> custom({
    Expression<String>? id,
    Expression<String>? author,
    Expression<String>? guild,
    Expression<String>? channel,
    Expression<String>? content,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (author != null) 'author': author,
      if (guild != null) 'guild': guild,
      if (channel != null) 'channel': channel,
      if (content != null) 'content': content,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  MessagesCompanion copyWith(
      {Value<String>? id,
      Value<String>? author,
      Value<String>? guild,
      Value<String>? channel,
      Value<String>? content,
      Value<DateTime>? timestamp}) {
    return MessagesCompanion(
      id: id ?? this.id,
      author: author ?? this.author,
      guild: guild ?? this.guild,
      channel: channel ?? this.channel,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (guild.present) {
      map['guild'] = Variable<String>(guild.value);
    }
    if (channel.present) {
      map['channel'] = Variable<String>(channel.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessagesCompanion(')
          ..write('id: $id, ')
          ..write('author: $author, ')
          ..write('guild: $guild, ')
          ..write('channel: $channel, ')
          ..write('content: $content, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $MessagesTable extends Messages with TableInfo<$MessagesTable, Message> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MessagesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedTextColumn id = _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedTextColumn author = _constructAuthor();
  GeneratedTextColumn _constructAuthor() {
    return GeneratedTextColumn(
      'author',
      $tableName,
      false,
    );
  }

  final VerificationMeta _guildMeta = const VerificationMeta('guild');
  @override
  late final GeneratedTextColumn guild = _constructGuild();
  GeneratedTextColumn _constructGuild() {
    return GeneratedTextColumn(
      'guild',
      $tableName,
      false,
    );
  }

  final VerificationMeta _channelMeta = const VerificationMeta('channel');
  @override
  late final GeneratedTextColumn channel = _constructChannel();
  GeneratedTextColumn _constructChannel() {
    return GeneratedTextColumn(
      'channel',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedTextColumn content = _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  @override
  late final GeneratedDateTimeColumn timestamp = _constructTimestamp();
  GeneratedDateTimeColumn _constructTimestamp() {
    return GeneratedDateTimeColumn(
      'timestamp',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, author, guild, channel, content, timestamp];
  @override
  $MessagesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'messages';
  @override
  final String actualTableName = 'messages';
  @override
  VerificationContext validateIntegrity(Insertable<Message> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('guild')) {
      context.handle(
          _guildMeta, guild.isAcceptableOrUnknown(data['guild']!, _guildMeta));
    } else if (isInserting) {
      context.missing(_guildMeta);
    }
    if (data.containsKey('channel')) {
      context.handle(_channelMeta,
          channel.isAcceptableOrUnknown(data['channel']!, _channelMeta));
    } else if (isInserting) {
      context.missing(_channelMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Message map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Message.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MessagesTable createAlias(String alias) {
    return $MessagesTable(_db, alias);
  }
}

class Attachment extends DataClass implements Insertable<Attachment> {
  final String id;
  final String guild;
  final String channel;
  final String url;
  final String filename;
  Attachment(
      {required this.id,
      required this.guild,
      required this.channel,
      required this.url,
      required this.filename});
  factory Attachment.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Attachment(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      guild: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}guild'])!,
      channel: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}channel'])!,
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
      filename: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}filename'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['guild'] = Variable<String>(guild);
    map['channel'] = Variable<String>(channel);
    map['url'] = Variable<String>(url);
    map['filename'] = Variable<String>(filename);
    return map;
  }

  AttachmentsCompanion toCompanion(bool nullToAbsent) {
    return AttachmentsCompanion(
      id: Value(id),
      guild: Value(guild),
      channel: Value(channel),
      url: Value(url),
      filename: Value(filename),
    );
  }

  factory Attachment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Attachment(
      id: serializer.fromJson<String>(json['id']),
      guild: serializer.fromJson<String>(json['guild']),
      channel: serializer.fromJson<String>(json['channel']),
      url: serializer.fromJson<String>(json['url']),
      filename: serializer.fromJson<String>(json['filename']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'guild': serializer.toJson<String>(guild),
      'channel': serializer.toJson<String>(channel),
      'url': serializer.toJson<String>(url),
      'filename': serializer.toJson<String>(filename),
    };
  }

  Attachment copyWith(
          {String? id,
          String? guild,
          String? channel,
          String? url,
          String? filename}) =>
      Attachment(
        id: id ?? this.id,
        guild: guild ?? this.guild,
        channel: channel ?? this.channel,
        url: url ?? this.url,
        filename: filename ?? this.filename,
      );
  @override
  String toString() {
    return (StringBuffer('Attachment(')
          ..write('id: $id, ')
          ..write('guild: $guild, ')
          ..write('channel: $channel, ')
          ..write('url: $url, ')
          ..write('filename: $filename')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(guild.hashCode,
          $mrjc(channel.hashCode, $mrjc(url.hashCode, filename.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Attachment &&
          other.id == this.id &&
          other.guild == this.guild &&
          other.channel == this.channel &&
          other.url == this.url &&
          other.filename == this.filename);
}

class AttachmentsCompanion extends UpdateCompanion<Attachment> {
  final Value<String> id;
  final Value<String> guild;
  final Value<String> channel;
  final Value<String> url;
  final Value<String> filename;
  const AttachmentsCompanion({
    this.id = const Value.absent(),
    this.guild = const Value.absent(),
    this.channel = const Value.absent(),
    this.url = const Value.absent(),
    this.filename = const Value.absent(),
  });
  AttachmentsCompanion.insert({
    required String id,
    required String guild,
    required String channel,
    required String url,
    required String filename,
  })  : id = Value(id),
        guild = Value(guild),
        channel = Value(channel),
        url = Value(url),
        filename = Value(filename);
  static Insertable<Attachment> custom({
    Expression<String>? id,
    Expression<String>? guild,
    Expression<String>? channel,
    Expression<String>? url,
    Expression<String>? filename,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (guild != null) 'guild': guild,
      if (channel != null) 'channel': channel,
      if (url != null) 'url': url,
      if (filename != null) 'filename': filename,
    });
  }

  AttachmentsCompanion copyWith(
      {Value<String>? id,
      Value<String>? guild,
      Value<String>? channel,
      Value<String>? url,
      Value<String>? filename}) {
    return AttachmentsCompanion(
      id: id ?? this.id,
      guild: guild ?? this.guild,
      channel: channel ?? this.channel,
      url: url ?? this.url,
      filename: filename ?? this.filename,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (guild.present) {
      map['guild'] = Variable<String>(guild.value);
    }
    if (channel.present) {
      map['channel'] = Variable<String>(channel.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (filename.present) {
      map['filename'] = Variable<String>(filename.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttachmentsCompanion(')
          ..write('id: $id, ')
          ..write('guild: $guild, ')
          ..write('channel: $channel, ')
          ..write('url: $url, ')
          ..write('filename: $filename')
          ..write(')'))
        .toString();
  }
}

class $AttachmentsTable extends Attachments
    with TableInfo<$AttachmentsTable, Attachment> {
  final GeneratedDatabase _db;
  final String? _alias;
  $AttachmentsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedTextColumn id = _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _guildMeta = const VerificationMeta('guild');
  @override
  late final GeneratedTextColumn guild = _constructGuild();
  GeneratedTextColumn _constructGuild() {
    return GeneratedTextColumn(
      'guild',
      $tableName,
      false,
    );
  }

  final VerificationMeta _channelMeta = const VerificationMeta('channel');
  @override
  late final GeneratedTextColumn channel = _constructChannel();
  GeneratedTextColumn _constructChannel() {
    return GeneratedTextColumn(
      'channel',
      $tableName,
      false,
    );
  }

  final VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedTextColumn url = _constructUrl();
  GeneratedTextColumn _constructUrl() {
    return GeneratedTextColumn(
      'url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _filenameMeta = const VerificationMeta('filename');
  @override
  late final GeneratedTextColumn filename = _constructFilename();
  GeneratedTextColumn _constructFilename() {
    return GeneratedTextColumn(
      'filename',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, guild, channel, url, filename];
  @override
  $AttachmentsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'attachments';
  @override
  final String actualTableName = 'attachments';
  @override
  VerificationContext validateIntegrity(Insertable<Attachment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('guild')) {
      context.handle(
          _guildMeta, guild.isAcceptableOrUnknown(data['guild']!, _guildMeta));
    } else if (isInserting) {
      context.missing(_guildMeta);
    }
    if (data.containsKey('channel')) {
      context.handle(_channelMeta,
          channel.isAcceptableOrUnknown(data['channel']!, _channelMeta));
    } else if (isInserting) {
      context.missing(_channelMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('filename')) {
      context.handle(_filenameMeta,
          filename.isAcceptableOrUnknown(data['filename']!, _filenameMeta));
    } else if (isInserting) {
      context.missing(_filenameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Attachment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Attachment.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $AttachmentsTable createAlias(String alias) {
    return $AttachmentsTable(_db, alias);
  }
}

class MessageAttachment extends DataClass
    implements Insertable<MessageAttachment> {
  final String messageId;
  final String attachmentId;
  MessageAttachment({required this.messageId, required this.attachmentId});
  factory MessageAttachment.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MessageAttachment(
      messageId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}message_id'])!,
      attachmentId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}attachment_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['message_id'] = Variable<String>(messageId);
    map['attachment_id'] = Variable<String>(attachmentId);
    return map;
  }

  MessageAttachmentsCompanion toCompanion(bool nullToAbsent) {
    return MessageAttachmentsCompanion(
      messageId: Value(messageId),
      attachmentId: Value(attachmentId),
    );
  }

  factory MessageAttachment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MessageAttachment(
      messageId: serializer.fromJson<String>(json['messageId']),
      attachmentId: serializer.fromJson<String>(json['attachmentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'messageId': serializer.toJson<String>(messageId),
      'attachmentId': serializer.toJson<String>(attachmentId),
    };
  }

  MessageAttachment copyWith({String? messageId, String? attachmentId}) =>
      MessageAttachment(
        messageId: messageId ?? this.messageId,
        attachmentId: attachmentId ?? this.attachmentId,
      );
  @override
  String toString() {
    return (StringBuffer('MessageAttachment(')
          ..write('messageId: $messageId, ')
          ..write('attachmentId: $attachmentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(messageId.hashCode, attachmentId.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MessageAttachment &&
          other.messageId == this.messageId &&
          other.attachmentId == this.attachmentId);
}

class MessageAttachmentsCompanion extends UpdateCompanion<MessageAttachment> {
  final Value<String> messageId;
  final Value<String> attachmentId;
  const MessageAttachmentsCompanion({
    this.messageId = const Value.absent(),
    this.attachmentId = const Value.absent(),
  });
  MessageAttachmentsCompanion.insert({
    required String messageId,
    required String attachmentId,
  })  : messageId = Value(messageId),
        attachmentId = Value(attachmentId);
  static Insertable<MessageAttachment> custom({
    Expression<String>? messageId,
    Expression<String>? attachmentId,
  }) {
    return RawValuesInsertable({
      if (messageId != null) 'message_id': messageId,
      if (attachmentId != null) 'attachment_id': attachmentId,
    });
  }

  MessageAttachmentsCompanion copyWith(
      {Value<String>? messageId, Value<String>? attachmentId}) {
    return MessageAttachmentsCompanion(
      messageId: messageId ?? this.messageId,
      attachmentId: attachmentId ?? this.attachmentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (messageId.present) {
      map['message_id'] = Variable<String>(messageId.value);
    }
    if (attachmentId.present) {
      map['attachment_id'] = Variable<String>(attachmentId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessageAttachmentsCompanion(')
          ..write('messageId: $messageId, ')
          ..write('attachmentId: $attachmentId')
          ..write(')'))
        .toString();
  }
}

class $MessageAttachmentsTable extends MessageAttachments
    with TableInfo<$MessageAttachmentsTable, MessageAttachment> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MessageAttachmentsTable(this._db, [this._alias]);
  final VerificationMeta _messageIdMeta = const VerificationMeta('messageId');
  @override
  late final GeneratedTextColumn messageId = _constructMessageId();
  GeneratedTextColumn _constructMessageId() {
    return GeneratedTextColumn('message_id', $tableName, false,
        $customConstraints: 'REFERENCES Messages(id)');
  }

  final VerificationMeta _attachmentIdMeta =
      const VerificationMeta('attachmentId');
  @override
  late final GeneratedTextColumn attachmentId = _constructAttachmentId();
  GeneratedTextColumn _constructAttachmentId() {
    return GeneratedTextColumn('attachment_id', $tableName, false,
        $customConstraints: 'REFERENCES Attachments(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [messageId, attachmentId];
  @override
  $MessageAttachmentsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'message_attachments';
  @override
  final String actualTableName = 'message_attachments';
  @override
  VerificationContext validateIntegrity(Insertable<MessageAttachment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('message_id')) {
      context.handle(_messageIdMeta,
          messageId.isAcceptableOrUnknown(data['message_id']!, _messageIdMeta));
    } else if (isInserting) {
      context.missing(_messageIdMeta);
    }
    if (data.containsKey('attachment_id')) {
      context.handle(
          _attachmentIdMeta,
          attachmentId.isAcceptableOrUnknown(
              data['attachment_id']!, _attachmentIdMeta));
    } else if (isInserting) {
      context.missing(_attachmentIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {messageId, attachmentId};
  @override
  MessageAttachment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MessageAttachment.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MessageAttachmentsTable createAlias(String alias) {
    return $MessageAttachmentsTable(_db, alias);
  }
}

abstract class _$RawData extends GeneratedDatabase {
  _$RawData(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MessagesTable messages = $MessagesTable(this);
  late final $AttachmentsTable attachments = $AttachmentsTable(this);
  late final $MessageAttachmentsTable messageAttachments =
      $MessageAttachmentsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [messages, attachments, messageAttachments];
}
