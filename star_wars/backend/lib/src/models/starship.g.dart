// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starship.dart';

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Starship extends _Starship {
  Starship(
      {this.id,
      this.error,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.length});

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
  int? length;

  Starship copyWith(
      {String? id,
      String? error,
      DateTime? createdAt,
      DateTime? updatedAt,
      String? name,
      int? length}) {
    return Starship(
        id: id ?? this.id,
        error: error ?? this.error,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        name: name ?? this.name,
        length: length ?? this.length);
  }

  @override
  bool operator ==(other) {
    return other is _Starship &&
        other.id == id &&
        other.error == error &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.name == name &&
        other.length == length;
  }

  @override
  int get hashCode {
    return hashObjects([id, error, createdAt, updatedAt, name, length]);
  }

  @override
  String toString() {
    return 'Starship(id=$id, error=$error, createdAt=$createdAt, updatedAt=$updatedAt, name=$name, length=$length)';
  }

  Map<String, dynamic> toJson() {
    return StarshipSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const StarshipSerializer starshipSerializer = StarshipSerializer();

class StarshipEncoder extends Converter<Starship, Map> {
  const StarshipEncoder();

  @override
  Map convert(Starship model) => StarshipSerializer.toMap(model);
}

class StarshipDecoder extends Converter<Map, Starship> {
  const StarshipDecoder();

  @override
  Starship convert(Map map) => StarshipSerializer.fromMap(map);
}

class StarshipSerializer extends Codec<Starship, Map> {
  const StarshipSerializer();

  @override
  StarshipEncoder get encoder => const StarshipEncoder();
  @override
  StarshipDecoder get decoder => const StarshipDecoder();
  static Starship fromMap(Map map) {
    return Starship(
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
        length: map['length'] as int?);
  }

  static Map<String, dynamic> toMap(_Starship? model) {
    if (model == null) {
      return {};
    }
    return {
      'id': model.id,
      'error': model.error,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'name': model.name,
      'length': model.length
    };
  }
}

abstract class StarshipFields {
  static const List<String> allFields = <String>[
    id,
    error,
    createdAt,
    updatedAt,
    name,
    length
  ];

  static const String id = 'id';

  static const String error = 'error';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String name = 'name';

  static const String length = 'length';
}

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

/// Auto-generated from [Starship].
final GraphQLObjectType starshipGraphQLType =
    objectType('Starship', isInterface: false, interfaces: [], fields: [
  field('id', graphQLString),
  field('error', graphQLString),
  field('created_at', graphQLDate),
  field('updated_at', graphQLDate),
  field('name', graphQLString),
  field('length', graphQLInt),
  field('idAsInt', graphQLInt)
]);
