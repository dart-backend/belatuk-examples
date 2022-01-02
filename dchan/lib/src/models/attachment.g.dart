// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// MigrationGenerator
// **************************************************************************

class AttachmentMigration extends Migration {
  @override
  void up(Schema schema) {
    schema.create('attachments', (table) {
      table.serial('id').primaryKey();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.integer('size_in_bytes');
      table.varChar('path', length: 255);
      table.varChar('filename', length: 255);
      table.integer('post_id');
      table.integer('index');
      table.varChar('content_type_string', length: 255);
    });
  }

  @override
  void down(Schema schema) {
    schema.drop('attachments');
  }
}

// **************************************************************************
// OrmGenerator
// **************************************************************************

class AttachmentQuery extends Query<Attachment, AttachmentQueryWhere> {
  AttachmentQuery({Query? parent, Set<String>? trampoline})
      : super(parent: parent) {
    trampoline ??= <String>{};
    trampoline.add(tableName);
    _where = AttachmentQueryWhere(this);
  }

  @override
  final AttachmentQueryValues values = AttachmentQueryValues();

  AttachmentQueryWhere? _where;

  @override
  Map<String, String> get casts {
    return {};
  }

  @override
  String get tableName {
    return 'attachments';
  }

  @override
  List<String> get fields {
    return const [
      'id',
      'created_at',
      'updated_at',
      'size_in_bytes',
      'path',
      'filename',
      'post_id',
      'index',
      'content_type_string'
    ];
  }

  @override
  AttachmentQueryWhere? get where {
    return _where;
  }

  @override
  AttachmentQueryWhere newWhereClause() {
    return AttachmentQueryWhere(this);
  }

  static Optional<Attachment> parseRow(List row) {
    if (row.every((x) => x == null)) {
      return Optional.empty();
    }
    var model = Attachment(
        id: row[0].toString(),
        createdAt: (row[1] as DateTime?),
        updatedAt: (row[2] as DateTime?),
        sizeInBytes: (row[3] as int?),
        path: (row[4] as String?),
        filename: (row[5] as String?),
        postId: (row[6] as int?),
        index: (row[7] as int?),
        contentTypeString: (row[8] as String?));
    return Optional.of(model);
  }

  @override
  Optional<Attachment> deserialize(List row) {
    return parseRow(row);
  }
}

class AttachmentQueryWhere extends QueryWhere {
  AttachmentQueryWhere(AttachmentQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        sizeInBytes = NumericSqlExpressionBuilder<int>(query, 'size_in_bytes'),
        path = StringSqlExpressionBuilder(query, 'path'),
        filename = StringSqlExpressionBuilder(query, 'filename'),
        postId = NumericSqlExpressionBuilder<int>(query, 'post_id'),
        index = NumericSqlExpressionBuilder<int>(query, 'index'),
        contentTypeString =
            StringSqlExpressionBuilder(query, 'content_type_string');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final NumericSqlExpressionBuilder<int> sizeInBytes;

  final StringSqlExpressionBuilder path;

  final StringSqlExpressionBuilder filename;

  final NumericSqlExpressionBuilder<int> postId;

  final NumericSqlExpressionBuilder<int> index;

  final StringSqlExpressionBuilder contentTypeString;

  @override
  List<SqlExpressionBuilder> get expressionBuilders {
    return [
      id,
      createdAt,
      updatedAt,
      sizeInBytes,
      path,
      filename,
      postId,
      index,
      contentTypeString
    ];
  }
}

class AttachmentQueryValues extends MapQueryValues {
  @override
  Map<String, String> get casts {
    return {};
  }

  String? get id {
    return (values['id'] as String?);
  }

  set id(String? value) => values['id'] = value;
  DateTime? get createdAt {
    return (values['created_at'] as DateTime?);
  }

  set createdAt(DateTime? value) => values['created_at'] = value;
  DateTime? get updatedAt {
    return (values['updated_at'] as DateTime?);
  }

  set updatedAt(DateTime? value) => values['updated_at'] = value;
  int? get sizeInBytes {
    return (values['size_in_bytes'] as int?);
  }

  set sizeInBytes(int? value) => values['size_in_bytes'] = value;
  String? get path {
    return (values['path'] as String?);
  }

  set path(String? value) => values['path'] = value;
  String? get filename {
    return (values['filename'] as String?);
  }

  set filename(String? value) => values['filename'] = value;
  int? get postId {
    return (values['post_id'] as int?);
  }

  set postId(int? value) => values['post_id'] = value;
  int? get index {
    return (values['index'] as int?);
  }

  set index(int? value) => values['index'] = value;
  String? get contentTypeString {
    return (values['content_type_string'] as String?);
  }

  set contentTypeString(String? value) => values['content_type_string'] = value;
  void copyFrom(Attachment model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    sizeInBytes = model.sizeInBytes;
    path = model.path;
    filename = model.filename;
    postId = model.postId;
    index = model.index;
    contentTypeString = model.contentTypeString;
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Attachment extends _Attachment {
  Attachment(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.sizeInBytes,
      this.path,
      this.filename,
      this.postId,
      this.index,
      this.contentTypeString});

  /// A unique identifier corresponding to this item.
  @override
  String? id;

  /// The time at which this item was created.
  @override
  DateTime? createdAt;

  /// The last time at which this item was updated.
  @override
  DateTime? updatedAt;

  @override
  int? sizeInBytes;

  @override
  String? path;

  @override
  String? filename;

  @override
  int? postId;

  @override
  int? index;

  @override
  String? contentTypeString;

  Attachment copyWith(
      {String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      int? sizeInBytes,
      String? path,
      String? filename,
      int? postId,
      int? index,
      String? contentTypeString}) {
    return Attachment(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        sizeInBytes: sizeInBytes ?? this.sizeInBytes,
        path: path ?? this.path,
        filename: filename ?? this.filename,
        postId: postId ?? this.postId,
        index: index ?? this.index,
        contentTypeString: contentTypeString ?? this.contentTypeString);
  }

  @override
  bool operator ==(other) {
    return other is _Attachment &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.sizeInBytes == sizeInBytes &&
        other.path == path &&
        other.filename == filename &&
        other.postId == postId &&
        other.index == index &&
        other.contentTypeString == contentTypeString;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      createdAt,
      updatedAt,
      sizeInBytes,
      path,
      filename,
      postId,
      index,
      contentTypeString
    ]);
  }

  @override
  String toString() {
    return 'Attachment(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, sizeInBytes=$sizeInBytes, path=$path, filename=$filename, postId=$postId, index=$index, contentTypeString=$contentTypeString)';
  }

  Map<String, dynamic> toJson() {
    return AttachmentSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const AttachmentSerializer attachmentSerializer = AttachmentSerializer();

class AttachmentEncoder extends Converter<Attachment, Map> {
  const AttachmentEncoder();

  @override
  Map convert(Attachment model) => AttachmentSerializer.toMap(model);
}

class AttachmentDecoder extends Converter<Map, Attachment> {
  const AttachmentDecoder();

  @override
  Attachment convert(Map map) => AttachmentSerializer.fromMap(map);
}

class AttachmentSerializer extends Codec<Attachment, Map> {
  const AttachmentSerializer();

  @override
  AttachmentEncoder get encoder => const AttachmentEncoder();
  @override
  AttachmentDecoder get decoder => const AttachmentDecoder();
  static Attachment fromMap(Map map) {
    return Attachment(
        id: map['id'] as String?,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null,
        sizeInBytes: map['size_in_bytes'] as int?,
        path: map['path'] as String?,
        filename: map['filename'] as String?,
        postId: map['post_id'] as int?,
        index: map['index'] as int?,
        contentTypeString: map['content_type_string'] as String?);
  }

  static Map<String, dynamic> toMap(_Attachment? model) {
    if (model == null) {
      return {};
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'size_in_bytes': model.sizeInBytes,
      'path': model.path,
      'filename': model.filename,
      'post_id': model.postId,
      'index': model.index,
      'content_type_string': model.contentTypeString
    };
  }
}

abstract class AttachmentFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    sizeInBytes,
    path,
    filename,
    postId,
    index,
    contentTypeString
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String sizeInBytes = 'size_in_bytes';

  static const String path = 'path';

  static const String filename = 'filename';

  static const String postId = 'post_id';

  static const String index = 'index';

  static const String contentTypeString = 'content_type_string';
}
