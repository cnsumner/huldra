// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables.dart';

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
      {@required this.id,
      @required this.author,
      @required this.guild,
      @required this.channel,
      @required this.content,
      @required this.timestamp});
  factory Message.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Message(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      author:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}author']),
      guild:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}guild']),
      channel:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}channel']),
      content:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}content']),
      timestamp: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}timestamp']),
    );
  }
  factory Message.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
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
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
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

  @override
  MessagesCompanion createCompanion(bool nullToAbsent) {
    return MessagesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      guild:
          guild == null && nullToAbsent ? const Value.absent() : Value(guild),
      channel: channel == null && nullToAbsent
          ? const Value.absent()
          : Value(channel),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      timestamp: timestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(timestamp),
    );
  }

  Message copyWith(
          {String id,
          String author,
          String guild,
          String channel,
          String content,
          DateTime timestamp}) =>
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
  bool operator ==(dynamic other) =>
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
    @required String id,
    @required String author,
    @required String guild,
    @required String channel,
    @required String content,
    @required DateTime timestamp,
  })  : id = Value(id),
        author = Value(author),
        guild = Value(guild),
        channel = Value(channel),
        content = Value(content),
        timestamp = Value(timestamp);
  MessagesCompanion copyWith(
      {Value<String> id,
      Value<String> author,
      Value<String> guild,
      Value<String> channel,
      Value<String> content,
      Value<DateTime> timestamp}) {
    return MessagesCompanion(
      id: id ?? this.id,
      author: author ?? this.author,
      guild: guild ?? this.guild,
      channel: channel ?? this.channel,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}

class $MessagesTable extends Messages with TableInfo<$MessagesTable, Message> {
  final GeneratedDatabase _db;
  final String _alias;
  $MessagesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _authorMeta = const VerificationMeta('author');
  GeneratedTextColumn _author;
  @override
  GeneratedTextColumn get author => _author ??= _constructAuthor();
  GeneratedTextColumn _constructAuthor() {
    return GeneratedTextColumn(
      'author',
      $tableName,
      false,
    );
  }

  final VerificationMeta _guildMeta = const VerificationMeta('guild');
  GeneratedTextColumn _guild;
  @override
  GeneratedTextColumn get guild => _guild ??= _constructGuild();
  GeneratedTextColumn _constructGuild() {
    return GeneratedTextColumn(
      'guild',
      $tableName,
      false,
    );
  }

  final VerificationMeta _channelMeta = const VerificationMeta('channel');
  GeneratedTextColumn _channel;
  @override
  GeneratedTextColumn get channel => _channel ??= _constructChannel();
  GeneratedTextColumn _constructChannel() {
    return GeneratedTextColumn(
      'channel',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  GeneratedTextColumn _content;
  @override
  GeneratedTextColumn get content => _content ??= _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  GeneratedDateTimeColumn _timestamp;
  @override
  GeneratedDateTimeColumn get timestamp => _timestamp ??= _constructTimestamp();
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
  VerificationContext validateIntegrity(MessagesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (d.author.present) {
      context.handle(
          _authorMeta, author.isAcceptableValue(d.author.value, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (d.guild.present) {
      context.handle(
          _guildMeta, guild.isAcceptableValue(d.guild.value, _guildMeta));
    } else if (isInserting) {
      context.missing(_guildMeta);
    }
    if (d.channel.present) {
      context.handle(_channelMeta,
          channel.isAcceptableValue(d.channel.value, _channelMeta));
    } else if (isInserting) {
      context.missing(_channelMeta);
    }
    if (d.content.present) {
      context.handle(_contentMeta,
          content.isAcceptableValue(d.content.value, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (d.timestamp.present) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableValue(d.timestamp.value, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Message map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Message.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(MessagesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.author.present) {
      map['author'] = Variable<String, StringType>(d.author.value);
    }
    if (d.guild.present) {
      map['guild'] = Variable<String, StringType>(d.guild.value);
    }
    if (d.channel.present) {
      map['channel'] = Variable<String, StringType>(d.channel.value);
    }
    if (d.content.present) {
      map['content'] = Variable<String, StringType>(d.content.value);
    }
    if (d.timestamp.present) {
      map['timestamp'] = Variable<DateTime, DateTimeType>(d.timestamp.value);
    }
    return map;
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
      {@required this.id,
      @required this.guild,
      @required this.channel,
      @required this.url,
      @required this.filename});
  factory Attachment.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return Attachment(
      id: stringType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      guild:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}guild']),
      channel:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}channel']),
      url: stringType.mapFromDatabaseResponse(data['${effectivePrefix}url']),
      filename: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}filename']),
    );
  }
  factory Attachment.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
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
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'guild': serializer.toJson<String>(guild),
      'channel': serializer.toJson<String>(channel),
      'url': serializer.toJson<String>(url),
      'filename': serializer.toJson<String>(filename),
    };
  }

  @override
  AttachmentsCompanion createCompanion(bool nullToAbsent) {
    return AttachmentsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      guild:
          guild == null && nullToAbsent ? const Value.absent() : Value(guild),
      channel: channel == null && nullToAbsent
          ? const Value.absent()
          : Value(channel),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      filename: filename == null && nullToAbsent
          ? const Value.absent()
          : Value(filename),
    );
  }

  Attachment copyWith(
          {String id,
          String guild,
          String channel,
          String url,
          String filename}) =>
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
  bool operator ==(dynamic other) =>
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
    @required String id,
    @required String guild,
    @required String channel,
    @required String url,
    @required String filename,
  })  : id = Value(id),
        guild = Value(guild),
        channel = Value(channel),
        url = Value(url),
        filename = Value(filename);
  AttachmentsCompanion copyWith(
      {Value<String> id,
      Value<String> guild,
      Value<String> channel,
      Value<String> url,
      Value<String> filename}) {
    return AttachmentsCompanion(
      id: id ?? this.id,
      guild: guild ?? this.guild,
      channel: channel ?? this.channel,
      url: url ?? this.url,
      filename: filename ?? this.filename,
    );
  }
}

class $AttachmentsTable extends Attachments
    with TableInfo<$AttachmentsTable, Attachment> {
  final GeneratedDatabase _db;
  final String _alias;
  $AttachmentsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _guildMeta = const VerificationMeta('guild');
  GeneratedTextColumn _guild;
  @override
  GeneratedTextColumn get guild => _guild ??= _constructGuild();
  GeneratedTextColumn _constructGuild() {
    return GeneratedTextColumn(
      'guild',
      $tableName,
      false,
    );
  }

  final VerificationMeta _channelMeta = const VerificationMeta('channel');
  GeneratedTextColumn _channel;
  @override
  GeneratedTextColumn get channel => _channel ??= _constructChannel();
  GeneratedTextColumn _constructChannel() {
    return GeneratedTextColumn(
      'channel',
      $tableName,
      false,
    );
  }

  final VerificationMeta _urlMeta = const VerificationMeta('url');
  GeneratedTextColumn _url;
  @override
  GeneratedTextColumn get url => _url ??= _constructUrl();
  GeneratedTextColumn _constructUrl() {
    return GeneratedTextColumn(
      'url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _filenameMeta = const VerificationMeta('filename');
  GeneratedTextColumn _filename;
  @override
  GeneratedTextColumn get filename => _filename ??= _constructFilename();
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
  VerificationContext validateIntegrity(AttachmentsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (d.guild.present) {
      context.handle(
          _guildMeta, guild.isAcceptableValue(d.guild.value, _guildMeta));
    } else if (isInserting) {
      context.missing(_guildMeta);
    }
    if (d.channel.present) {
      context.handle(_channelMeta,
          channel.isAcceptableValue(d.channel.value, _channelMeta));
    } else if (isInserting) {
      context.missing(_channelMeta);
    }
    if (d.url.present) {
      context.handle(_urlMeta, url.isAcceptableValue(d.url.value, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (d.filename.present) {
      context.handle(_filenameMeta,
          filename.isAcceptableValue(d.filename.value, _filenameMeta));
    } else if (isInserting) {
      context.missing(_filenameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Attachment map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Attachment.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(AttachmentsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<String, StringType>(d.id.value);
    }
    if (d.guild.present) {
      map['guild'] = Variable<String, StringType>(d.guild.value);
    }
    if (d.channel.present) {
      map['channel'] = Variable<String, StringType>(d.channel.value);
    }
    if (d.url.present) {
      map['url'] = Variable<String, StringType>(d.url.value);
    }
    if (d.filename.present) {
      map['filename'] = Variable<String, StringType>(d.filename.value);
    }
    return map;
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
  MessageAttachment({@required this.messageId, @required this.attachmentId});
  factory MessageAttachment.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return MessageAttachment(
      messageId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}message_id']),
      attachmentId: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}attachment_id']),
    );
  }
  factory MessageAttachment.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MessageAttachment(
      messageId: serializer.fromJson<String>(json['messageId']),
      attachmentId: serializer.fromJson<String>(json['attachmentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'messageId': serializer.toJson<String>(messageId),
      'attachmentId': serializer.toJson<String>(attachmentId),
    };
  }

  @override
  MessageAttachmentsCompanion createCompanion(bool nullToAbsent) {
    return MessageAttachmentsCompanion(
      messageId: messageId == null && nullToAbsent
          ? const Value.absent()
          : Value(messageId),
      attachmentId: attachmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(attachmentId),
    );
  }

  MessageAttachment copyWith({String messageId, String attachmentId}) =>
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
  bool operator ==(dynamic other) =>
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
    @required String messageId,
    @required String attachmentId,
  })  : messageId = Value(messageId),
        attachmentId = Value(attachmentId);
  MessageAttachmentsCompanion copyWith(
      {Value<String> messageId, Value<String> attachmentId}) {
    return MessageAttachmentsCompanion(
      messageId: messageId ?? this.messageId,
      attachmentId: attachmentId ?? this.attachmentId,
    );
  }
}

class $MessageAttachmentsTable extends MessageAttachments
    with TableInfo<$MessageAttachmentsTable, MessageAttachment> {
  final GeneratedDatabase _db;
  final String _alias;
  $MessageAttachmentsTable(this._db, [this._alias]);
  final VerificationMeta _messageIdMeta = const VerificationMeta('messageId');
  GeneratedTextColumn _messageId;
  @override
  GeneratedTextColumn get messageId => _messageId ??= _constructMessageId();
  GeneratedTextColumn _constructMessageId() {
    return GeneratedTextColumn('message_id', $tableName, false,
        $customConstraints: 'REFERENCES Messages(id)');
  }

  final VerificationMeta _attachmentIdMeta =
      const VerificationMeta('attachmentId');
  GeneratedTextColumn _attachmentId;
  @override
  GeneratedTextColumn get attachmentId =>
      _attachmentId ??= _constructAttachmentId();
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
  VerificationContext validateIntegrity(MessageAttachmentsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.messageId.present) {
      context.handle(_messageIdMeta,
          messageId.isAcceptableValue(d.messageId.value, _messageIdMeta));
    } else if (isInserting) {
      context.missing(_messageIdMeta);
    }
    if (d.attachmentId.present) {
      context.handle(
          _attachmentIdMeta,
          attachmentId.isAcceptableValue(
              d.attachmentId.value, _attachmentIdMeta));
    } else if (isInserting) {
      context.missing(_attachmentIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {messageId, attachmentId};
  @override
  MessageAttachment map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return MessageAttachment.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(MessageAttachmentsCompanion d) {
    final map = <String, Variable>{};
    if (d.messageId.present) {
      map['message_id'] = Variable<String, StringType>(d.messageId.value);
    }
    if (d.attachmentId.present) {
      map['attachment_id'] = Variable<String, StringType>(d.attachmentId.value);
    }
    return map;
  }

  @override
  $MessageAttachmentsTable createAlias(String alias) {
    return $MessageAttachmentsTable(_db, alias);
  }
}

abstract class _$Knowledgebase extends GeneratedDatabase {
  _$Knowledgebase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $MessagesTable _messages;
  $MessagesTable get messages => _messages ??= $MessagesTable(this);
  $AttachmentsTable _attachments;
  $AttachmentsTable get attachments => _attachments ??= $AttachmentsTable(this);
  $MessageAttachmentsTable _messageAttachments;
  $MessageAttachmentsTable get messageAttachments =>
      _messageAttachments ??= $MessageAttachmentsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [messages, attachments, messageAttachments];
}
