// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'human.dart';

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Human extends _Human {
  Human(
      {this.id,
      this.error,
      this.createdAt,
      this.updatedAt,
      this.name,
      List<Episode> appearsIn = const [],
      List<Character> friends = const [],
      this.totalCredits})
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

  @override
  List<Character> friends;

  @override
  int? totalCredits;

  Human copyWith(
      {String? id,
      String? error,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? name,
      List<Episode>? appearsIn,
      List<Character>? friends,
      int? totalCredits}) {
    return Human(
        id: id ?? this.id,
        error: error ?? this.error,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        name: name ?? this.name,
        appearsIn: appearsIn ?? this.appearsIn,
        friends: friends ?? this.friends,
        totalCredits: totalCredits ?? this.totalCredits);
  }

  @override
  bool operator ==(other) {
    return other is _Human &&
        other.id == id &&
        other.error == error &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.id == id &&
        other.name == name &&
        ListEquality<Episode>(DefaultEquality<Episode>())
            .equals(other.appearsIn, appearsIn) &&
        ListEquality<Character>(DefaultEquality<Character>())
            .equals(other.friends, friends) &&
        other.totalCredits == totalCredits;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      error,
      createdAt,
      updatedAt,
      id,
      name,
      appearsIn,
      friends,
      totalCredits
    ]);
  }

  @override
  String toString() {
    return 'Human(id=$id, error=$error, createdAt=$createdAt, updatedAt=$updatedAt, id=$id, name=$name, appearsIn=$appearsIn, friends=$friends, totalCredits=$totalCredits)';
  }

  Map<String, dynamic> toJson() {
    return HumanSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const HumanSerializer humanSerializer = HumanSerializer();

class HumanEncoder extends Converter<Human, Map> {
  const HumanEncoder();

  @override
  Map convert(Human model) => HumanSerializer.toMap(model);
}

class HumanDecoder extends Converter<Map, Human> {
  const HumanDecoder();

  @override
  Human convert(Map map) => HumanSerializer.fromMap(map);
}

class HumanSerializer extends Codec<Human, Map> {
  const HumanSerializer();

  @override
  HumanEncoder get encoder => const HumanEncoder();
  @override
  HumanDecoder get decoder => const HumanDecoder();
  static Human fromMap(Map map) {
    return Human(
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
            : [],
        totalCredits: map['total_credits'] as int?);
  }

  static Map<String, dynamic> toMap(_Human? model) {
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
      'friends': model.friends,
      'total_credits': model.totalCredits
    };
  }
}

abstract class HumanFields {
  static const List<String> allFields = <String>[
    id,
    error,
    createdAt,
    updatedAt,
    id,
    name,
    appearsIn,
    friends,
    totalCredits
  ];

  static const String id = 'id';

  static const String error = 'error';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String name = 'name';

  static const String appearsIn = 'appears_in';

  static const String friends = 'friends';

  static const String totalCredits = 'total_credits';
}

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

/// Auto-generated from [Human].
final GraphQLObjectType humanGraphQLType =
    objectType('Human', isInterface: false, interfaces: [
  characterGraphQLType
], fields: [
  field('id', graphQLString),
  field('error', graphQLString),
  field('created_at', graphQLDate),
  field('updated_at', graphQLDate),
  field('id', graphQLString),
  field('name', graphQLString),
  field('appears_in', listOf(episodeGraphQLType)),
  field('friends', listOf(characterGraphQLType)),
  field('total_credits', graphQLInt),
  field('idAsInt', graphQLInt)
]);
