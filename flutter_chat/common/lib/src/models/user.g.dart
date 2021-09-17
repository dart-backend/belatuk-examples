// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class User implements _User {
  User({required this.name, required this.avatarBytes});

  @override
  String? name;

  @override
  Uint8List? avatarBytes;

  User copyWith({String? name, Uint8List? avatarBytes}) {
    return User(
        name: name ?? this.name, avatarBytes: avatarBytes ?? this.avatarBytes);
  }

  @override
  bool operator ==(other) {
    return other is _User &&
        other.name == name &&
        ListEquality().equals(other.avatarBytes, avatarBytes);
  }

  @override
  int get hashCode {
    return hashObjects([name, avatarBytes]);
  }

  @override
  String toString() {
    return 'User(name=$name, avatarBytes=$avatarBytes)';
  }

  Map<String, dynamic> toJson() {
    return UserSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const UserSerializer userSerializer = UserSerializer();

class UserEncoder extends Converter<User, Map> {
  const UserEncoder();

  @override
  Map convert(User model) => UserSerializer.toMap(model);
}

class UserDecoder extends Converter<Map, User> {
  const UserDecoder();

  @override
  User convert(Map map) => UserSerializer.fromMap(map);
}

class UserSerializer extends Codec<User, Map> {
  const UserSerializer();

  @override
  UserEncoder get encoder => const UserEncoder();
  @override
  UserDecoder get decoder => const UserDecoder();
  static User fromMap(Map map) {
    if (map['name'] == null) {
      throw FormatException("Missing required field 'name' on User.");
    }

    if (map['avatar_bytes'] == null) {
      throw FormatException("Missing required field 'avatar_bytes' on User.");
    }

    return User(
        name: map['name'] as String?,
        avatarBytes: map['avatar_bytes'] is Uint8List
            ? (map['avatar_bytes'] as Uint8List)
            : (map['avatar_bytes'] is Iterable<int>
                ? Uint8List.fromList(
                    (map['avatar_bytes'] as Iterable<int>).toList())
                : (map['avatar_bytes'] is String
                    ? Uint8List.fromList(
                        base64.decode(map['avatar_bytes'] as String))
                    : null)));
  }

  static Map<String, dynamic> toMap(_User? model) {
    if (model == null) {
      return {};
    }
    return {
      'name': model.name,
      'avatar_bytes':
          model.avatarBytes != null ? base64.encode(model.avatarBytes!) : null
    };
  }
}

abstract class UserFields {
  static const List<String> allFields = <String>[name, avatarBytes];

  static const String name = 'name';

  static const String avatarBytes = 'avatar_bytes';
}
