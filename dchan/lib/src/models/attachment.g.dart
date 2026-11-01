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
      table.integer('post_id');
      table.integer('index');
      table.integer('size_in_bytes');
      table.varChar('path', length: 255);
      table.varChar('filename', length: 255);
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
  AttachmentQuery({super.parent, Set<String>? trampoline}) {
    trampoline ??= <String>{};
    trampoline.add(tableName);
    _where = AttachmentQueryWhere(this);
  }

  @override
  final AttachmentQueryValues values = AttachmentQueryValues();

  List<String> _selectedFields = [];

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
    const localFields = [
      'id',
      'created_at',
      'updated_at',
      'post_id',
      'index',
      'size_in_bytes',
      'path',
      'filename',
      'content_type_string',
    ];
    return _selectedFields.isEmpty
        ? localFields
        : localFields
              .where((field) => _selectedFields.contains(field))
              .toList();
  }

  AttachmentQuery select(List<String> selectedFields) {
    _selectedFields = selectedFields;
    return this;
  }

  @override
  AttachmentQueryWhere? get where {
    return _where;
  }

  @override
  AttachmentQueryWhere newWhereClause() {
    return AttachmentQueryWhere(this);
  }

  Optional<Attachment> parseRow(List row) {
    if (row.every((x) => x == null)) {
      return Optional.empty();
    }
    var model = Attachment(
      id: fields.contains('id') ? row[fields.indexOf('id')].toString() : null,
      createdAt: fields.contains('created_at')
          ? mapToNullableDateTime(row[fields.indexOf('created_at')])
          : null,
      updatedAt: fields.contains('updated_at')
          ? mapToNullableDateTime(row[fields.indexOf('updated_at')])
          : null,
      postId: fields.contains('post_id')
          ? mapToInt(row[fields.indexOf('post_id')])
          : null,
      index: fields.contains('index')
          ? mapToInt(row[fields.indexOf('index')])
          : null,
      sizeInBytes: fields.contains('size_in_bytes')
          ? mapToInt(row[fields.indexOf('size_in_bytes')])
          : null,
      path: fields.contains('path')
          ? (row[fields.indexOf('path')] as String?)
          : null,
      filename: fields.contains('filename')
          ? (row[fields.indexOf('filename')] as String?)
          : null,
      contentTypeString: fields.contains('content_type_string')
          ? (row[fields.indexOf('content_type_string')] as String?)
          : null,
    );
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
      postId = NumericSqlExpressionBuilder<int>(query, 'post_id'),
      index = NumericSqlExpressionBuilder<int>(query, 'index'),
      sizeInBytes = NumericSqlExpressionBuilder<int>(query, 'size_in_bytes'),
      path = StringSqlExpressionBuilder(query, 'path'),
      filename = StringSqlExpressionBuilder(query, 'filename'),
      contentTypeString = StringSqlExpressionBuilder(
        query,
        'content_type_string',
      );

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final NumericSqlExpressionBuilder<int> postId;

  final NumericSqlExpressionBuilder<int> index;

  final NumericSqlExpressionBuilder<int> sizeInBytes;

  final StringSqlExpressionBuilder path;

  final StringSqlExpressionBuilder filename;

  final StringSqlExpressionBuilder contentTypeString;

  @override
  List<SqlExpressionBuilder> get expressionBuilders {
    return [
      id,
      createdAt,
      updatedAt,
      postId,
      index,
      sizeInBytes,
      path,
      filename,
      contentTypeString,
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

  int? get postId {
    return (values['post_id'] as int?);
  }

  set postId(int? value) => values['post_id'] = value;

  int? get index {
    return (values['index'] as int?);
  }

  set index(int? value) => values['index'] = value;

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

  String? get contentTypeString {
    return (values['content_type_string'] as String?);
  }

  set contentTypeString(String? value) => values['content_type_string'] = value;

  void copyFrom(Attachment model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    postId = model.postId;
    index = model.index;
    sizeInBytes = model.sizeInBytes;
    path = model.path;
    filename = model.filename;
    contentTypeString = model.contentTypeString;
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Attachment extends _Attachment {
  Attachment({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.postId,
    this.index,
    this.sizeInBytes,
    this.path,
    this.filename,
    this.contentTypeString,
  });

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
  int? postId;

  @override
  int? index;

  @override
  int? sizeInBytes;

  @override
  String? path;

  @override
  String? filename;

  @override
  String? contentTypeString;

  Attachment copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? postId,
    int? index,
    int? sizeInBytes,
    String? path,
    String? filename,
    String? contentTypeString,
  }) {
    return Attachment(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      postId: postId ?? this.postId,
      index: index ?? this.index,
      sizeInBytes: sizeInBytes ?? this.sizeInBytes,
      path: path ?? this.path,
      filename: filename ?? this.filename,
      contentTypeString: contentTypeString ?? this.contentTypeString,
    );
  }

  @override
  bool operator ==(other) {
    return other is _Attachment &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.postId == postId &&
        other.index == index &&
        other.sizeInBytes == sizeInBytes &&
        other.path == path &&
        other.filename == filename &&
        other.contentTypeString == contentTypeString;
  }

  @override
  int get hashCode {
    return Object.hashAll([
      id,
      createdAt,
      updatedAt,
      postId,
      index,
      sizeInBytes,
      path,
      filename,
      contentTypeString,
    ]);
  }

  @override
  String toString() {
    return 'Attachment(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, postId=$postId, index=$index, sizeInBytes=$sizeInBytes, path=$path, filename=$filename, contentTypeString=$contentTypeString)';
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
      postId: map['post_id'] as int?,
      index: map['index'] as int?,
      sizeInBytes: map['size_in_bytes'] as int?,
      path: map['path'] as String?,
      filename: map['filename'] as String?,
      contentTypeString: map['content_type_string'] as String?,
    );
  }

  static Map<String, dynamic> toMap(_Attachment? model) {
    if (model == null) {
      throw FormatException("Required field [model] cannot be null");
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'post_id': model.postId,
      'index': model.index,
      'size_in_bytes': model.sizeInBytes,
      'path': model.path,
      'filename': model.filename,
      'content_type_string': model.contentTypeString,
    };
  }
}

abstract class AttachmentFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    postId,
    index,
    sizeInBytes,
    path,
    filename,
    contentTypeString,
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String postId = 'post_id';

  static const String index = 'index';

  static const String sizeInBytes = 'size_in_bytes';

  static const String path = 'path';

  static const String filename = 'filename';

  static const String contentTypeString = 'content_type_string';
}
