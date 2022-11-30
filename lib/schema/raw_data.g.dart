// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raw_data.dart';

// ignore_for_file: type=lint
class Message extends DataClass implements Insertable<Message> {
  final String id;
  final String author;
  final String guild;
  final String channel;
  final String content;
  final DateTime timestamp;
  const Message(
      {required this.id,
      required this.author,
      required this.guild,
      required this.channel,
      required this.content,
      required this.timestamp});
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
    serializer ??= driftRuntimeOptions.defaultSerializer;
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
    serializer ??= driftRuntimeOptions.defaultSerializer;
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
  int get hashCode =>
      Object.hash(id, author, guild, channel, content, timestamp);
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
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _guildMeta = const VerificationMeta('guild');
  @override
  late final GeneratedColumn<String> guild = GeneratedColumn<String>(
      'guild', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _channelMeta =
      const VerificationMeta('channel');
  @override
  late final GeneratedColumn<String> channel = GeneratedColumn<String>(
      'channel', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, author, guild, channel, content, timestamp];
  @override
  String get aliasedName => _alias ?? 'messages';
  @override
  String get actualTableName => 'messages';
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
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Message(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author'])!,
      guild: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}guild'])!,
      channel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}channel'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $MessagesTable createAlias(String alias) {
    return $MessagesTable(attachedDatabase, alias);
  }
}

class Attachment extends DataClass implements Insertable<Attachment> {
  final String id;
  final String guild;
  final String channel;
  final String url;
  final String filename;
  const Attachment(
      {required this.id,
      required this.guild,
      required this.channel,
      required this.url,
      required this.filename});
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
    serializer ??= driftRuntimeOptions.defaultSerializer;
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
    serializer ??= driftRuntimeOptions.defaultSerializer;
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
  int get hashCode => Object.hash(id, guild, channel, url, filename);
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
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttachmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _guildMeta = const VerificationMeta('guild');
  @override
  late final GeneratedColumn<String> guild = GeneratedColumn<String>(
      'guild', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _channelMeta =
      const VerificationMeta('channel');
  @override
  late final GeneratedColumn<String> channel = GeneratedColumn<String>(
      'channel', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _filenameMeta =
      const VerificationMeta('filename');
  @override
  late final GeneratedColumn<String> filename = GeneratedColumn<String>(
      'filename', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, guild, channel, url, filename];
  @override
  String get aliasedName => _alias ?? 'attachments';
  @override
  String get actualTableName => 'attachments';
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
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Attachment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      guild: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}guild'])!,
      channel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}channel'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      filename: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}filename'])!,
    );
  }

  @override
  $AttachmentsTable createAlias(String alias) {
    return $AttachmentsTable(attachedDatabase, alias);
  }
}

class MessageAttachment extends DataClass
    implements Insertable<MessageAttachment> {
  final String messageId;
  final String attachmentId;
  const MessageAttachment(
      {required this.messageId, required this.attachmentId});
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
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MessageAttachment(
      messageId: serializer.fromJson<String>(json['messageId']),
      attachmentId: serializer.fromJson<String>(json['attachmentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
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
  int get hashCode => Object.hash(messageId, attachmentId);
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
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessageAttachmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _messageIdMeta =
      const VerificationMeta('messageId');
  @override
  late final GeneratedColumn<String> messageId = GeneratedColumn<String>(
      'message_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES Messages(id)');
  static const VerificationMeta _attachmentIdMeta =
      const VerificationMeta('attachmentId');
  @override
  late final GeneratedColumn<String> attachmentId = GeneratedColumn<String>(
      'attachment_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES Attachments(id)');
  @override
  List<GeneratedColumn> get $columns => [messageId, attachmentId];
  @override
  String get aliasedName => _alias ?? 'message_attachments';
  @override
  String get actualTableName => 'message_attachments';
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
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MessageAttachment(
      messageId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}message_id'])!,
      attachmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}attachment_id'])!,
    );
  }

  @override
  $MessageAttachmentsTable createAlias(String alias) {
    return $MessageAttachmentsTable(attachedDatabase, alias);
  }
}

abstract class _$RawData extends GeneratedDatabase {
  _$RawData(QueryExecutor e) : super(e);
  late final $MessagesTable messages = $MessagesTable(this);
  late final $AttachmentsTable attachments = $AttachmentsTable(this);
  late final $MessageAttachmentsTable messageAttachments =
      $MessageAttachmentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [messages, attachments, messageAttachments];
}
