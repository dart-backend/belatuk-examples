import 'package:dbcrypt/dbcrypt.dart';

class User {
  static final DBCrypt bCrypt = DBCrypt();
  final String username, hashedPassword;

  User._(this.username, this.hashedPassword);

  factory User(String username, String password) {
    var salt = bCrypt.gensalt();
    return User._(username, bCrypt.hashpw(password, salt));
  }

  factory User.deserialize(String deserialized) {
    var params = Uri.splitQueryString(deserialized);
    return User._(params['username'] ?? '', params['password'] ?? '');
  }

  bool validate(String pw) => bCrypt.checkpw(pw, hashedPassword);

  String serialize() =>
      'username=${Uri.encodeQueryComponent(username)}&password=${Uri.encodeQueryComponent(hashedPassword)}';
}
