// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'droid.dart';

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Droid extends _Droid {
  Droid(
      {this.id,
      this.error,
      this.createdAt,
      this.updatedAt,
      this.name,
      List<Episode> appearsIn = const [],
      List<Character> friends = const []})
      : appearsIn = List.unmodifiable(appearsIn),
        friends = List.unmodifiable(friends);

  /// A unique identifier corresponding to this item.
  @override
  String? id;

  @override
  String? error;

  /// The time at which this item was created.
  @override
  DateTime? createdAt;

  /// The last time at which this item was updated.
  @override
  DateTime? updatedAt;

  @override
  String? name;

  @override
  List<Episode> appearsIn;

  /// Doc comments automatically become GraphQL descriptions.
  @override
  List<Character> friends;

  Droid copyWith(
      {String? id,
      String? error,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? name,
      List<Episode>? appearsIn,
      List<Character>? friends}) {
    return Droid(
        id: id ?? this.id,
        error: error ?? this.error,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        name: name ?? this.name,
        appearsIn: appearsIn ?? this.appearsIn,
        friends: friends ?? this.friends);
  }

  @override
  bool operator ==(other) {
    return other is _Droid &&
        other.id == id &&
        other.error == error &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.id == id &&
        other.name == name &&
        ListEquality<Episode>(DefaultEquality<Episode>())
            .equals(other.appearsIn, appearsIn) &&
        ListEquality<Character>(DefaultEquality<Character>())
            .equals(other.friends, friends);
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, error, createdAt, updatedAt, id, name, appearsIn, friends]);
  }

  @override
  String toString() {
    return 'Droid(id=$id, error=$error, createdAt=$createdAt, updatedAt=$updatedAt, id=$id, name=$name, appearsIn=$appearsIn, friends=$friends)';
  }

  Map<String, dynamic> toJson() {
    return DroidSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const DroidSerializer droidSerializer = DroidSerializer();

class DroidEncoder extends Converter<Droid, Map> {
  const DroidEncoder();

  @override
  Map convert(Droid model) => DroidSerializer.toMap(model);
}

class DroidDecoder extends Converter<Map, Droid> {
  const DroidDecoder();

  @override
  Droid convert(Map map) => DroidSerializer.fromMap(map);
}

class DroidSerializer extends Codec<Droid, Map> {
  const DroidSerializer();

  @override
  DroidEncoder get encoder => const DroidEncoder();
  @override
  DroidDecoder get decoder => const DroidDecoder();
  static Droid fromMap(Map map) {
    return Droid(
        id: map['id'] as String?,
        error: map['error'] as String?,
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
        name: map['name'] as String?,
        appearsIn: map['appears_in'] is Iterable
            ? (map['appears_in'] as Iterable).cast<Episode>().toList()
            : [],
        friends: map['friends'] is Iterable
            ? (map['friends'] as Iterable).cast<Character>().toList()
            : []);
  }

  static Map<String, dynamic> toMap(_Droid? model) {
    if (model == null) {
      return {};
    }
    return {
      'id': model.id,
      'error': model.error,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'name': model.name,
      'appears_in': model.appearsIn,
      'friends': model.friends
    };
  }
}

abstract class DroidFields {
  static const List<String> allFields = <String>[
    id,
    error,
    createdAt,
    updatedAt,
    id,
    name,
    appearsIn,
    friends
  ];

  static const String id = 'id';

  static const String error = 'error';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String name = 'name';

  static const String appearsIn = 'appears_in';

  static const String friends = 'friends';
}

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

/// Auto-generated from [Droid].
final GraphQLObjectType droidGraphQLType = objectType('Droid',
    isInterface: false,
    description: 'Beep! Boop!',
    interfaces: [
      characterGraphQLType
    ],
    fields: [
      field('id', graphQLString),
      field('error', graphQLString),
      field('created_at', graphQLDate),
      field('updated_at', graphQLDate),
      field('id', graphQLString),
      field('name', graphQLString),
      field('appears_in', listOf(episodeGraphQLType),
          description: 'The list of episodes this droid appears in.'),
      field('friends', listOf(characterGraphQLType),
          description:
              'Doc comments automatically become GraphQL descriptions.'),
      field('idAsInt', graphQLInt)
    ]);
