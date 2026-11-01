import 'package:dbcrypt/dbcrypt.dart';

/// A user, who logs in with [username] and a password, of which only a
/// bcrypt hash is kept.
class User {
  static final DBCrypt _bCrypt = DBCrypt();

  /// A hash of no user's password, which [checkPassword] checks a password
  /// against when there is no user, so that a log in takes as long either
  /// way, and does not tell which usernames exist. It has the cost of the
  /// users' hashes (10, of `gensalt`), and is not a secret: it is of
  /// `'no user'`.
  static const String _noUserHash =
      r'$2b$10$.biVDE1E0MRFHzWXFQzQxu4liVO7cVOSbfnlTuyoU2SzxOd9TpkLe';

  final String username;
  final String _hashedPassword;

  User(this.username, String password)
    : _hashedPassword = _bCrypt.hashpw(password, _bCrypt.gensalt());

  /// Whether [password] is [user]'s. With no [user], a hash is checked all the
  /// same, and `false` returned.
  static bool checkPassword(User? user, String password) {
    var matches = _bCrypt.checkpw(
      password,
      user?._hashedPassword ?? _noUserHash,
    );
    return user != null && matches;
  }
}
