// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class User implements _User {
  const User({required this.name, required this.avatarBytes});

  @override
  final String? name;

  @override
  final Uint8List? avatarBytes;

  User copyWith({String? name, Uint8List? avatarBytes}) {
    return User(
        name: name ?? this.name, avatarBytes: avatarBytes ?? this.avatarBytes);
  }

  @override
  bool operator ==(other) {
    return other is _User &&
        other.name == name &&
        const ListEquality().equals(other.avatarBytes, avatarBytes);
  }

  @override
  int get hashCode {
    return hashObjects([name, avatarBytes]);
  }

  Map<String, dynamic>? toJson() {
    return UserSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

abstract class UserSerializer {
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
            ? (map['avatar_bytes'] as Uint8List?)
            : (map['avatar_bytes'] is Iterable<int>
                ? Uint8List.fromList(
                    (map['avatar_bytes'] as Iterable<int>).toList())
                : (map['avatar_bytes'] is String
                    ? Uint8List.fromList(
                        base64.decode(map['avatar_bytes'] as String))
                    : null)));
  }

  static Map<String, dynamic>? toMap(_User? model) {
    if (model == null) {
      return null;
    }
    if (model.name == null) {
      throw FormatException("Missing required field 'name' on User.");
    }

    if (model.avatarBytes == null) {
      throw FormatException("Missing required field 'avatar_bytes' on User.");
    }

    return {
      'name': model.name,
      'avatar_bytes':
          model.avatarBytes == null ? null : base64.encode(model.avatarBytes!)
    };
  }
}

abstract class UserFields {
  static const List<String> allFields = <String>[name, avatarBytes];

  static const String name = 'name';

  static const String avatarBytes = 'avatar_bytes';
}
