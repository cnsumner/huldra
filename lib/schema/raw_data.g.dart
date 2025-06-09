// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raw_data.dart';

// ignore_for_file: type=lint
class $MessagesTable extends Messages with TableInfo<$MessagesTable, Message> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _guildMeta = const VerificationMeta('guild');
  @override
  late final GeneratedColumn<String> guild = GeneratedColumn<String>(
    'guild',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _channelMeta = const VerificationMeta(
    'channel',
  );
  @override
  late final GeneratedColumn<String> channel = GeneratedColumn<String>(
    'channel',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    author,
    guild,
    channel,
    content,
    timestamp,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'messages';
  @override
  VerificationContext validateIntegrity(
    Insertable<Message> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('guild')) {
      context.handle(
        _guildMeta,
        guild.isAcceptableOrUnknown(data['guild']!, _guildMeta),
      );
    } else if (isInserting) {
      context.missing(_guildMeta);
    }
    if (data.containsKey('channel')) {
      context.handle(
        _channelMeta,
        channel.isAcceptableOrUnknown(data['channel']!, _channelMeta),
      );
    } else if (isInserting) {
      context.missing(_channelMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
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
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      author: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author'],
      )!,
      guild: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guild'],
      )!,
      channel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}channel'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
    );
  }

  @override
  $MessagesTable createAlias(String alias) {
    return $MessagesTable(attachedDatabase, alias);
  }
}

class Message extends DataClass implements Insertable<Message> {
  final String id;
  final String author;
  final String guild;
  final String channel;
  final String content;
  final DateTime timestamp;
  const Message({
    required this.id,
    required this.author,
    required this.guild,
    required this.channel,
    required this.content,
    required this.timestamp,
  });
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

  factory Message.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  Message copyWith({
    String? id,
    String? author,
    String? guild,
    String? channel,
    String? content,
    DateTime? timestamp,
  }) => Message(
    id: id ?? this.id,
    author: author ?? this.author,
    guild: guild ?? this.guild,
    channel: channel ?? this.channel,
    content: content ?? this.content,
    timestamp: timestamp ?? this.timestamp,
  );
  Message copyWithCompanion(MessagesCompanion data) {
    return Message(
      id: data.id.present ? data.id.value : this.id,
      author: data.author.present ? data.author.value : this.author,
      guild: data.guild.present ? data.guild.value : this.guild,
      channel: data.channel.present ? data.channel.value : this.channel,
      content: data.content.present ? data.content.value : this.content,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

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
  final Value<int> rowid;
  const MessagesCompanion({
    this.id = const Value.absent(),
    this.author = const Value.absent(),
    this.guild = const Value.absent(),
    this.channel = const Value.absent(),
    this.content = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MessagesCompanion.insert({
    required String id,
    required String author,
    required String guild,
    required String channel,
    required String content,
    required DateTime timestamp,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
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
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (author != null) 'author': author,
      if (guild != null) 'guild': guild,
      if (channel != null) 'channel': channel,
      if (content != null) 'content': content,
      if (timestamp != null) 'timestamp': timestamp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MessagesCompanion copyWith({
    Value<String>? id,
    Value<String>? author,
    Value<String>? guild,
    Value<String>? channel,
    Value<String>? content,
    Value<DateTime>? timestamp,
    Value<int>? rowid,
  }) {
    return MessagesCompanion(
      id: id ?? this.id,
      author: author ?? this.author,
      guild: guild ?? this.guild,
      channel: channel ?? this.channel,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      rowid: rowid ?? this.rowid,
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
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
          ..write('timestamp: $timestamp, ')
          ..write('rowid: $rowid')
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
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _guildMeta = const VerificationMeta('guild');
  @override
  late final GeneratedColumn<String> guild = GeneratedColumn<String>(
    'guild',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _channelMeta = const VerificationMeta(
    'channel',
  );
  @override
  late final GeneratedColumn<String> channel = GeneratedColumn<String>(
    'channel',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filenameMeta = const VerificationMeta(
    'filename',
  );
  @override
  late final GeneratedColumn<String> filename = GeneratedColumn<String>(
    'filename',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, guild, channel, url, filename];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attachments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Attachment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('guild')) {
      context.handle(
        _guildMeta,
        guild.isAcceptableOrUnknown(data['guild']!, _guildMeta),
      );
    } else if (isInserting) {
      context.missing(_guildMeta);
    }
    if (data.containsKey('channel')) {
      context.handle(
        _channelMeta,
        channel.isAcceptableOrUnknown(data['channel']!, _channelMeta),
      );
    } else if (isInserting) {
      context.missing(_channelMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('filename')) {
      context.handle(
        _filenameMeta,
        filename.isAcceptableOrUnknown(data['filename']!, _filenameMeta),
      );
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
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      guild: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}guild'],
      )!,
      channel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}channel'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      filename: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}filename'],
      )!,
    );
  }

  @override
  $AttachmentsTable createAlias(String alias) {
    return $AttachmentsTable(attachedDatabase, alias);
  }
}

class Attachment extends DataClass implements Insertable<Attachment> {
  final String id;
  final String guild;
  final String channel;
  final String url;
  final String filename;
  const Attachment({
    required this.id,
    required this.guild,
    required this.channel,
    required this.url,
    required this.filename,
  });
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

  factory Attachment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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

  Attachment copyWith({
    String? id,
    String? guild,
    String? channel,
    String? url,
    String? filename,
  }) => Attachment(
    id: id ?? this.id,
    guild: guild ?? this.guild,
    channel: channel ?? this.channel,
    url: url ?? this.url,
    filename: filename ?? this.filename,
  );
  Attachment copyWithCompanion(AttachmentsCompanion data) {
    return Attachment(
      id: data.id.present ? data.id.value : this.id,
      guild: data.guild.present ? data.guild.value : this.guild,
      channel: data.channel.present ? data.channel.value : this.channel,
      url: data.url.present ? data.url.value : this.url,
      filename: data.filename.present ? data.filename.value : this.filename,
    );
  }

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
  final Value<int> rowid;
  const AttachmentsCompanion({
    this.id = const Value.absent(),
    this.guild = const Value.absent(),
    this.channel = const Value.absent(),
    this.url = const Value.absent(),
    this.filename = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AttachmentsCompanion.insert({
    required String id,
    required String guild,
    required String channel,
    required String url,
    required String filename,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
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
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (guild != null) 'guild': guild,
      if (channel != null) 'channel': channel,
      if (url != null) 'url': url,
      if (filename != null) 'filename': filename,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AttachmentsCompanion copyWith({
    Value<String>? id,
    Value<String>? guild,
    Value<String>? channel,
    Value<String>? url,
    Value<String>? filename,
    Value<int>? rowid,
  }) {
    return AttachmentsCompanion(
      id: id ?? this.id,
      guild: guild ?? this.guild,
      channel: channel ?? this.channel,
      url: url ?? this.url,
      filename: filename ?? this.filename,
      rowid: rowid ?? this.rowid,
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
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
          ..write('filename: $filename, ')
          ..write('rowid: $rowid')
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
  static const VerificationMeta _messageIdMeta = const VerificationMeta(
    'messageId',
  );
  @override
  late final GeneratedColumn<String> messageId = GeneratedColumn<String>(
    'message_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES messages (id)',
    ),
  );
  static const VerificationMeta _attachmentIdMeta = const VerificationMeta(
    'attachmentId',
  );
  @override
  late final GeneratedColumn<String> attachmentId = GeneratedColumn<String>(
    'attachment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES attachments (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [messageId, attachmentId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'message_attachments';
  @override
  VerificationContext validateIntegrity(
    Insertable<MessageAttachment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('message_id')) {
      context.handle(
        _messageIdMeta,
        messageId.isAcceptableOrUnknown(data['message_id']!, _messageIdMeta),
      );
    } else if (isInserting) {
      context.missing(_messageIdMeta);
    }
    if (data.containsKey('attachment_id')) {
      context.handle(
        _attachmentIdMeta,
        attachmentId.isAcceptableOrUnknown(
          data['attachment_id']!,
          _attachmentIdMeta,
        ),
      );
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
      messageId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message_id'],
      )!,
      attachmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}attachment_id'],
      )!,
    );
  }

  @override
  $MessageAttachmentsTable createAlias(String alias) {
    return $MessageAttachmentsTable(attachedDatabase, alias);
  }
}

class MessageAttachment extends DataClass
    implements Insertable<MessageAttachment> {
  final String messageId;
  final String attachmentId;
  const MessageAttachment({
    required this.messageId,
    required this.attachmentId,
  });
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

  factory MessageAttachment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
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
  MessageAttachment copyWithCompanion(MessageAttachmentsCompanion data) {
    return MessageAttachment(
      messageId: data.messageId.present ? data.messageId.value : this.messageId,
      attachmentId: data.attachmentId.present
          ? data.attachmentId.value
          : this.attachmentId,
    );
  }

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
  final Value<int> rowid;
  const MessageAttachmentsCompanion({
    this.messageId = const Value.absent(),
    this.attachmentId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MessageAttachmentsCompanion.insert({
    required String messageId,
    required String attachmentId,
    this.rowid = const Value.absent(),
  }) : messageId = Value(messageId),
       attachmentId = Value(attachmentId);
  static Insertable<MessageAttachment> custom({
    Expression<String>? messageId,
    Expression<String>? attachmentId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (messageId != null) 'message_id': messageId,
      if (attachmentId != null) 'attachment_id': attachmentId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MessageAttachmentsCompanion copyWith({
    Value<String>? messageId,
    Value<String>? attachmentId,
    Value<int>? rowid,
  }) {
    return MessageAttachmentsCompanion(
      messageId: messageId ?? this.messageId,
      attachmentId: attachmentId ?? this.attachmentId,
      rowid: rowid ?? this.rowid,
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
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MessageAttachmentsCompanion(')
          ..write('messageId: $messageId, ')
          ..write('attachmentId: $attachmentId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$RawData extends GeneratedDatabase {
  _$RawData(QueryExecutor e) : super(e);
  $RawDataManager get managers => $RawDataManager(this);
  late final $MessagesTable messages = $MessagesTable(this);
  late final $AttachmentsTable attachments = $AttachmentsTable(this);
  late final $MessageAttachmentsTable messageAttachments =
      $MessageAttachmentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    messages,
    attachments,
    messageAttachments,
  ];
}

typedef $$MessagesTableCreateCompanionBuilder =
    MessagesCompanion Function({
      required String id,
      required String author,
      required String guild,
      required String channel,
      required String content,
      required DateTime timestamp,
      Value<int> rowid,
    });
typedef $$MessagesTableUpdateCompanionBuilder =
    MessagesCompanion Function({
      Value<String> id,
      Value<String> author,
      Value<String> guild,
      Value<String> channel,
      Value<String> content,
      Value<DateTime> timestamp,
      Value<int> rowid,
    });

final class $$MessagesTableReferences
    extends BaseReferences<_$RawData, $MessagesTable, Message> {
  $$MessagesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MessageAttachmentsTable, List<MessageAttachment>>
  _messageAttachmentsRefsTable(_$RawData db) => MultiTypedResultKey.fromTable(
    db.messageAttachments,
    aliasName: $_aliasNameGenerator(
      db.messages.id,
      db.messageAttachments.messageId,
    ),
  );

  $$MessageAttachmentsTableProcessedTableManager get messageAttachmentsRefs {
    final manager = $$MessageAttachmentsTableTableManager(
      $_db,
      $_db.messageAttachments,
    ).filter((f) => f.messageId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _messageAttachmentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MessagesTableFilterComposer
    extends Composer<_$RawData, $MessagesTable> {
  $$MessagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get guild => $composableBuilder(
    column: $table.guild,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get channel => $composableBuilder(
    column: $table.channel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> messageAttachmentsRefs(
    Expression<bool> Function($$MessageAttachmentsTableFilterComposer f) f,
  ) {
    final $$MessageAttachmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.messageAttachments,
      getReferencedColumn: (t) => t.messageId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessageAttachmentsTableFilterComposer(
            $db: $db,
            $table: $db.messageAttachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MessagesTableOrderingComposer
    extends Composer<_$RawData, $MessagesTable> {
  $$MessagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get guild => $composableBuilder(
    column: $table.guild,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get channel => $composableBuilder(
    column: $table.channel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MessagesTableAnnotationComposer
    extends Composer<_$RawData, $MessagesTable> {
  $$MessagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<String> get guild =>
      $composableBuilder(column: $table.guild, builder: (column) => column);

  GeneratedColumn<String> get channel =>
      $composableBuilder(column: $table.channel, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  Expression<T> messageAttachmentsRefs<T extends Object>(
    Expression<T> Function($$MessageAttachmentsTableAnnotationComposer a) f,
  ) {
    final $$MessageAttachmentsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.messageAttachments,
          getReferencedColumn: (t) => t.messageId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MessageAttachmentsTableAnnotationComposer(
                $db: $db,
                $table: $db.messageAttachments,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$MessagesTableTableManager
    extends
        RootTableManager<
          _$RawData,
          $MessagesTable,
          Message,
          $$MessagesTableFilterComposer,
          $$MessagesTableOrderingComposer,
          $$MessagesTableAnnotationComposer,
          $$MessagesTableCreateCompanionBuilder,
          $$MessagesTableUpdateCompanionBuilder,
          (Message, $$MessagesTableReferences),
          Message,
          PrefetchHooks Function({bool messageAttachmentsRefs})
        > {
  $$MessagesTableTableManager(_$RawData db, $MessagesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MessagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MessagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MessagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> author = const Value.absent(),
                Value<String> guild = const Value.absent(),
                Value<String> channel = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MessagesCompanion(
                id: id,
                author: author,
                guild: guild,
                channel: channel,
                content: content,
                timestamp: timestamp,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String author,
                required String guild,
                required String channel,
                required String content,
                required DateTime timestamp,
                Value<int> rowid = const Value.absent(),
              }) => MessagesCompanion.insert(
                id: id,
                author: author,
                guild: guild,
                channel: channel,
                content: content,
                timestamp: timestamp,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MessagesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({messageAttachmentsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (messageAttachmentsRefs) db.messageAttachments,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (messageAttachmentsRefs)
                    await $_getPrefetchedData<
                      Message,
                      $MessagesTable,
                      MessageAttachment
                    >(
                      currentTable: table,
                      referencedTable: $$MessagesTableReferences
                          ._messageAttachmentsRefsTable(db),
                      managerFromTypedResult: (p0) => $$MessagesTableReferences(
                        db,
                        table,
                        p0,
                      ).messageAttachmentsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.messageId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MessagesTableProcessedTableManager =
    ProcessedTableManager<
      _$RawData,
      $MessagesTable,
      Message,
      $$MessagesTableFilterComposer,
      $$MessagesTableOrderingComposer,
      $$MessagesTableAnnotationComposer,
      $$MessagesTableCreateCompanionBuilder,
      $$MessagesTableUpdateCompanionBuilder,
      (Message, $$MessagesTableReferences),
      Message,
      PrefetchHooks Function({bool messageAttachmentsRefs})
    >;
typedef $$AttachmentsTableCreateCompanionBuilder =
    AttachmentsCompanion Function({
      required String id,
      required String guild,
      required String channel,
      required String url,
      required String filename,
      Value<int> rowid,
    });
typedef $$AttachmentsTableUpdateCompanionBuilder =
    AttachmentsCompanion Function({
      Value<String> id,
      Value<String> guild,
      Value<String> channel,
      Value<String> url,
      Value<String> filename,
      Value<int> rowid,
    });

final class $$AttachmentsTableReferences
    extends BaseReferences<_$RawData, $AttachmentsTable, Attachment> {
  $$AttachmentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MessageAttachmentsTable, List<MessageAttachment>>
  _messageAttachmentsRefsTable(_$RawData db) => MultiTypedResultKey.fromTable(
    db.messageAttachments,
    aliasName: $_aliasNameGenerator(
      db.attachments.id,
      db.messageAttachments.attachmentId,
    ),
  );

  $$MessageAttachmentsTableProcessedTableManager get messageAttachmentsRefs {
    final manager = $$MessageAttachmentsTableTableManager(
      $_db,
      $_db.messageAttachments,
    ).filter((f) => f.attachmentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _messageAttachmentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AttachmentsTableFilterComposer
    extends Composer<_$RawData, $AttachmentsTable> {
  $$AttachmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get guild => $composableBuilder(
    column: $table.guild,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get channel => $composableBuilder(
    column: $table.channel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filename => $composableBuilder(
    column: $table.filename,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> messageAttachmentsRefs(
    Expression<bool> Function($$MessageAttachmentsTableFilterComposer f) f,
  ) {
    final $$MessageAttachmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.messageAttachments,
      getReferencedColumn: (t) => t.attachmentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessageAttachmentsTableFilterComposer(
            $db: $db,
            $table: $db.messageAttachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AttachmentsTableOrderingComposer
    extends Composer<_$RawData, $AttachmentsTable> {
  $$AttachmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get guild => $composableBuilder(
    column: $table.guild,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get channel => $composableBuilder(
    column: $table.channel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filename => $composableBuilder(
    column: $table.filename,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AttachmentsTableAnnotationComposer
    extends Composer<_$RawData, $AttachmentsTable> {
  $$AttachmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get guild =>
      $composableBuilder(column: $table.guild, builder: (column) => column);

  GeneratedColumn<String> get channel =>
      $composableBuilder(column: $table.channel, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get filename =>
      $composableBuilder(column: $table.filename, builder: (column) => column);

  Expression<T> messageAttachmentsRefs<T extends Object>(
    Expression<T> Function($$MessageAttachmentsTableAnnotationComposer a) f,
  ) {
    final $$MessageAttachmentsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.messageAttachments,
          getReferencedColumn: (t) => t.attachmentId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$MessageAttachmentsTableAnnotationComposer(
                $db: $db,
                $table: $db.messageAttachments,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AttachmentsTableTableManager
    extends
        RootTableManager<
          _$RawData,
          $AttachmentsTable,
          Attachment,
          $$AttachmentsTableFilterComposer,
          $$AttachmentsTableOrderingComposer,
          $$AttachmentsTableAnnotationComposer,
          $$AttachmentsTableCreateCompanionBuilder,
          $$AttachmentsTableUpdateCompanionBuilder,
          (Attachment, $$AttachmentsTableReferences),
          Attachment,
          PrefetchHooks Function({bool messageAttachmentsRefs})
        > {
  $$AttachmentsTableTableManager(_$RawData db, $AttachmentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AttachmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AttachmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AttachmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> guild = const Value.absent(),
                Value<String> channel = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<String> filename = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AttachmentsCompanion(
                id: id,
                guild: guild,
                channel: channel,
                url: url,
                filename: filename,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String guild,
                required String channel,
                required String url,
                required String filename,
                Value<int> rowid = const Value.absent(),
              }) => AttachmentsCompanion.insert(
                id: id,
                guild: guild,
                channel: channel,
                url: url,
                filename: filename,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AttachmentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({messageAttachmentsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (messageAttachmentsRefs) db.messageAttachments,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (messageAttachmentsRefs)
                    await $_getPrefetchedData<
                      Attachment,
                      $AttachmentsTable,
                      MessageAttachment
                    >(
                      currentTable: table,
                      referencedTable: $$AttachmentsTableReferences
                          ._messageAttachmentsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$AttachmentsTableReferences(
                            db,
                            table,
                            p0,
                          ).messageAttachmentsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.attachmentId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AttachmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$RawData,
      $AttachmentsTable,
      Attachment,
      $$AttachmentsTableFilterComposer,
      $$AttachmentsTableOrderingComposer,
      $$AttachmentsTableAnnotationComposer,
      $$AttachmentsTableCreateCompanionBuilder,
      $$AttachmentsTableUpdateCompanionBuilder,
      (Attachment, $$AttachmentsTableReferences),
      Attachment,
      PrefetchHooks Function({bool messageAttachmentsRefs})
    >;
typedef $$MessageAttachmentsTableCreateCompanionBuilder =
    MessageAttachmentsCompanion Function({
      required String messageId,
      required String attachmentId,
      Value<int> rowid,
    });
typedef $$MessageAttachmentsTableUpdateCompanionBuilder =
    MessageAttachmentsCompanion Function({
      Value<String> messageId,
      Value<String> attachmentId,
      Value<int> rowid,
    });

final class $$MessageAttachmentsTableReferences
    extends
        BaseReferences<_$RawData, $MessageAttachmentsTable, MessageAttachment> {
  $$MessageAttachmentsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MessagesTable _messageIdTable(_$RawData db) =>
      db.messages.createAlias(
        $_aliasNameGenerator(db.messageAttachments.messageId, db.messages.id),
      );

  $$MessagesTableProcessedTableManager get messageId {
    final $_column = $_itemColumn<String>('message_id')!;

    final manager = $$MessagesTableTableManager(
      $_db,
      $_db.messages,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_messageIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AttachmentsTable _attachmentIdTable(_$RawData db) =>
      db.attachments.createAlias(
        $_aliasNameGenerator(
          db.messageAttachments.attachmentId,
          db.attachments.id,
        ),
      );

  $$AttachmentsTableProcessedTableManager get attachmentId {
    final $_column = $_itemColumn<String>('attachment_id')!;

    final manager = $$AttachmentsTableTableManager(
      $_db,
      $_db.attachments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_attachmentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MessageAttachmentsTableFilterComposer
    extends Composer<_$RawData, $MessageAttachmentsTable> {
  $$MessageAttachmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$MessagesTableFilterComposer get messageId {
    final $$MessagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messageId,
      referencedTable: $db.messages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessagesTableFilterComposer(
            $db: $db,
            $table: $db.messages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AttachmentsTableFilterComposer get attachmentId {
    final $$AttachmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.attachmentId,
      referencedTable: $db.attachments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttachmentsTableFilterComposer(
            $db: $db,
            $table: $db.attachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MessageAttachmentsTableOrderingComposer
    extends Composer<_$RawData, $MessageAttachmentsTable> {
  $$MessageAttachmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$MessagesTableOrderingComposer get messageId {
    final $$MessagesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messageId,
      referencedTable: $db.messages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessagesTableOrderingComposer(
            $db: $db,
            $table: $db.messages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AttachmentsTableOrderingComposer get attachmentId {
    final $$AttachmentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.attachmentId,
      referencedTable: $db.attachments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttachmentsTableOrderingComposer(
            $db: $db,
            $table: $db.attachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MessageAttachmentsTableAnnotationComposer
    extends Composer<_$RawData, $MessageAttachmentsTable> {
  $$MessageAttachmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$MessagesTableAnnotationComposer get messageId {
    final $$MessagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.messageId,
      referencedTable: $db.messages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MessagesTableAnnotationComposer(
            $db: $db,
            $table: $db.messages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AttachmentsTableAnnotationComposer get attachmentId {
    final $$AttachmentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.attachmentId,
      referencedTable: $db.attachments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttachmentsTableAnnotationComposer(
            $db: $db,
            $table: $db.attachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MessageAttachmentsTableTableManager
    extends
        RootTableManager<
          _$RawData,
          $MessageAttachmentsTable,
          MessageAttachment,
          $$MessageAttachmentsTableFilterComposer,
          $$MessageAttachmentsTableOrderingComposer,
          $$MessageAttachmentsTableAnnotationComposer,
          $$MessageAttachmentsTableCreateCompanionBuilder,
          $$MessageAttachmentsTableUpdateCompanionBuilder,
          (MessageAttachment, $$MessageAttachmentsTableReferences),
          MessageAttachment,
          PrefetchHooks Function({bool messageId, bool attachmentId})
        > {
  $$MessageAttachmentsTableTableManager(
    _$RawData db,
    $MessageAttachmentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MessageAttachmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MessageAttachmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MessageAttachmentsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> messageId = const Value.absent(),
                Value<String> attachmentId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MessageAttachmentsCompanion(
                messageId: messageId,
                attachmentId: attachmentId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String messageId,
                required String attachmentId,
                Value<int> rowid = const Value.absent(),
              }) => MessageAttachmentsCompanion.insert(
                messageId: messageId,
                attachmentId: attachmentId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MessageAttachmentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({messageId = false, attachmentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (messageId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.messageId,
                                referencedTable:
                                    $$MessageAttachmentsTableReferences
                                        ._messageIdTable(db),
                                referencedColumn:
                                    $$MessageAttachmentsTableReferences
                                        ._messageIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (attachmentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.attachmentId,
                                referencedTable:
                                    $$MessageAttachmentsTableReferences
                                        ._attachmentIdTable(db),
                                referencedColumn:
                                    $$MessageAttachmentsTableReferences
                                        ._attachmentIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MessageAttachmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$RawData,
      $MessageAttachmentsTable,
      MessageAttachment,
      $$MessageAttachmentsTableFilterComposer,
      $$MessageAttachmentsTableOrderingComposer,
      $$MessageAttachmentsTableAnnotationComposer,
      $$MessageAttachmentsTableCreateCompanionBuilder,
      $$MessageAttachmentsTableUpdateCompanionBuilder,
      (MessageAttachment, $$MessageAttachmentsTableReferences),
      MessageAttachment,
      PrefetchHooks Function({bool messageId, bool attachmentId})
    >;

class $RawDataManager {
  final _$RawData _db;
  $RawDataManager(this._db);
  $$MessagesTableTableManager get messages =>
      $$MessagesTableTableManager(_db, _db.messages);
  $$AttachmentsTableTableManager get attachments =>
      $$AttachmentsTableTableManager(_db, _db.attachments);
  $$MessageAttachmentsTableTableManager get messageAttachments =>
      $$MessageAttachmentsTableTableManager(_db, _db.messageAttachments);
}
