// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// MigrationGenerator
// **************************************************************************

class PostMigration extends Migration {
  @override
  void up(Schema schema) {
    schema.create('posts', (table) {
      table.serial('id').primaryKey();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.varChar('text', length: 255);
      table.varChar('user_hash', length: 255);
      table.integer('in_reply_to');
    });
  }

  @override
  void down(Schema schema) {
    schema.drop('posts', cascade: true);
  }
}

// **************************************************************************
// OrmGenerator
// **************************************************************************

class PostQuery extends Query<Post, PostQueryWhere> {
  PostQuery({Query? parent, Set<String>? trampoline}) : super(parent: parent) {
    trampoline ??= <String>{};
    trampoline.add(tableName);
    _where = PostQueryWhere(this);
    leftJoin(
        _attachments = AttachmentQuery(trampoline: trampoline, parent: this),
        'id',
        'post_id',
        additionalFields: const [
          'id',
          'created_at',
          'updated_at',
          'size_in_bytes',
          'path',
          'filename',
          'post_id',
          'index',
          'content_type_string'
        ],
        trampoline: trampoline);
  }

  @override
  final PostQueryValues values = PostQueryValues();

  List<String> _selectedFields = [];

  PostQueryWhere? _where;

  late AttachmentQuery _attachments;

  @override
  Map<String, String> get casts {
    return {};
  }

  @override
  String get tableName {
    return 'posts';
  }

  @override
  List<String> get fields {
    const _fields = [
      'id',
      'created_at',
      'updated_at',
      'text',
      'user_hash',
      'in_reply_to'
    ];
    return _selectedFields.isEmpty
        ? _fields
        : _fields.where((field) => _selectedFields.contains(field)).toList();
  }

  PostQuery select(List<String> selectedFields) {
    _selectedFields = selectedFields;
    return this;
  }

  @override
  PostQueryWhere? get where {
    return _where;
  }

  @override
  PostQueryWhere newWhereClause() {
    return PostQueryWhere(this);
  }

  Optional<Post> parseRow(List row) {
    if (row.every((x) => x == null)) {
      return Optional.empty();
    }
    var model = Post(
        id: fields.contains('id') ? row[0].toString() : null,
        createdAt: fields.contains('created_at') ? mapToDateTime(row[1]) : null,
        updatedAt: fields.contains('updated_at') ? mapToDateTime(row[2]) : null,
        text: fields.contains('text') ? (row[3] as String?) : null,
        userHash: fields.contains('user_hash') ? (row[4] as String?) : null,
        inReplyTo: fields.contains('in_reply_to') ? (row[5] as int?) : null);
    if (row.length > 6) {
      var modelOpt = AttachmentQuery().parseRow(row.skip(6).take(9).toList());
      modelOpt.ifPresent((m) {
        model = model.copyWith(attachments: [m]);
      });
    }
    return Optional.of(model);
  }

  @override
  Optional<Post> deserialize(List row) {
    return parseRow(row);
  }

  AttachmentQuery get attachments {
    return _attachments;
  }

  @override
  Future<List<Post>> get(QueryExecutor executor) {
    return super.get(executor).then((result) {
      return result.fold<List<Post>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                attachments: List<Attachment>.from(l.attachments)
                  ..addAll(model.attachments));
        }
      });
    });
  }

  @override
  Future<List<Post>> update(QueryExecutor executor) {
    return super.update(executor).then((result) {
      return result.fold<List<Post>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                attachments: List<Attachment>.from(l.attachments)
                  ..addAll(model.attachments));
        }
      });
    });
  }

  @override
  Future<List<Post>> delete(QueryExecutor executor) {
    return super.delete(executor).then((result) {
      return result.fold<List<Post>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                attachments: List<Attachment>.from(l.attachments)
                  ..addAll(model.attachments));
        }
      });
    });
  }
}

class PostQueryWhere extends QueryWhere {
  PostQueryWhere(PostQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at'),
        text = StringSqlExpressionBuilder(query, 'text'),
        userHash = StringSqlExpressionBuilder(query, 'user_hash'),
        inReplyTo = NumericSqlExpressionBuilder<int>(query, 'in_reply_to');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  final StringSqlExpressionBuilder text;

  final StringSqlExpressionBuilder userHash;

  final NumericSqlExpressionBuilder<int> inReplyTo;

  @override
  List<SqlExpressionBuilder> get expressionBuilders {
    return [id, createdAt, updatedAt, text, userHash, inReplyTo];
  }
}

class PostQueryValues extends MapQueryValues {
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
  String? get text {
    return (values['text'] as String?);
  }

  set text(String? value) => values['text'] = value;
  String? get userHash {
    return (values['user_hash'] as String?);
  }

  set userHash(String? value) => values['user_hash'] = value;
  int? get inReplyTo {
    return (values['in_reply_to'] as int?);
  }

  set inReplyTo(int? value) => values['in_reply_to'] = value;
  void copyFrom(Post model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    text = model.text;
    userHash = model.userHash;
    inReplyTo = model.inReplyTo;
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Post extends _Post {
  Post(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.text,
      this.userHash,
      this.inReplyTo,
      List<Attachment> attachments = const []})
      : attachments = List.unmodifiable(attachments);

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
  String? text;

  @override
  String? userHash;

  @override
  int? inReplyTo;

  @override
  List<Attachment> attachments;

  Post copyWith(
      {String? id,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? text,
      String? userHash,
      int? inReplyTo,
      List<Attachment>? attachments}) {
    return Post(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        text: text ?? this.text,
        userHash: userHash ?? this.userHash,
        inReplyTo: inReplyTo ?? this.inReplyTo,
        attachments: attachments ?? this.attachments);
  }

  @override
  bool operator ==(other) {
    return other is _Post &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.text == text &&
        other.userHash == userHash &&
        other.inReplyTo == inReplyTo &&
        ListEquality<Attachment>(DefaultEquality<Attachment>())
            .equals(other.attachments, attachments);
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, createdAt, updatedAt, text, userHash, inReplyTo, attachments]);
  }

  @override
  String toString() {
    return 'Post(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, text=$text, userHash=$userHash, inReplyTo=$inReplyTo, attachments=$attachments)';
  }

  Map<String, dynamic> toJson() {
    return PostSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const PostSerializer postSerializer = PostSerializer();

class PostEncoder extends Converter<Post, Map> {
  const PostEncoder();

  @override
  Map convert(Post model) => PostSerializer.toMap(model);
}

class PostDecoder extends Converter<Map, Post> {
  const PostDecoder();

  @override
  Post convert(Map map) => PostSerializer.fromMap(map);
}

class PostSerializer extends Codec<Post, Map> {
  const PostSerializer();

  @override
  PostEncoder get encoder => const PostEncoder();
  @override
  PostDecoder get decoder => const PostDecoder();
  static Post fromMap(Map map) {
    return Post(
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
        text: map['text'] as String?,
        userHash: map['user_hash'] as String?,
        inReplyTo: map['in_reply_to'] as int?,
        attachments: map['attachments'] is Iterable
            ? List.unmodifiable(
                ((map['attachments'] as Iterable).whereType<Map>())
                    .map(AttachmentSerializer.fromMap))
            : []);
  }

  static Map<String, dynamic> toMap(_Post? model) {
    if (model == null) {
      throw FormatException("Required field [model] cannot be null");
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'text': model.text,
      'user_hash': model.userHash,
      'in_reply_to': model.inReplyTo,
      'attachments':
          model.attachments.map((m) => AttachmentSerializer.toMap(m)).toList()
    };
  }
}

abstract class PostFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    text,
    userHash,
    inReplyTo,
    attachments
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String text = 'text';

  static const String userHash = 'user_hash';

  static const String inReplyTo = 'in_reply_to';

  static const String attachments = 'attachments';
}
