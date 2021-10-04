import 'package:angel3_auth/angel3_auth.dart';
import 'package:angel3_framework/angel3_framework.dart';
import 'package:angel3_framework/http.dart';
import 'package:angel3_static/angel3_static.dart';
import 'package:auth/auth.dart';
import 'package:file/local.dart';
import 'package:logging/logging.dart';

void main() async {
  var app = Angel();

  // Note: the `secureCookies` flag is important during development, iF you are using cookies.
  //
  // `localhost` cannot use `Secure` cookies, if it's not over HTTPS, which it often isn't.
  //
  // Add functions to (de)serialize a user for the purposes of representation within a token.
  // In a real application, instead of serializing the user itself, you can just return its ID,
  // and when deserializing, perform a database lookup.
  var auth = AngelAuth<User>(
      serializer: (u) => u.serialize(),
      deserializer: (serialized) => User.deserialize(serialized.toString()),
      jwtKey: 'abcdefghijklmnopqrstuvwxyz012345',
      secureCookies: app.environment.isProduction);

  var fs = LocalFileSystem();

  /// Using a `CachingVirtualDirectory` can improve page load times.
  var vDir = CachingVirtualDirectory(app, fs, source: fs.directory('web'));

  var users = [
    User('demo', 'demo123'),
    User('admin', 'admin123'),
  ];

  // Tell the authenticator how to validate a username+password auth attempt.
  // Return `null` on a failed attempt.
  auth.strategies['local'] = LocalAuthStrategy((username, password) {
    var list = users.where((u) => u.username == username);
    if (list.isEmpty) {
      print('User = null');
      return null;
    }
    var user = list.first;
    print('User = ${user.username}');
    var result = user.validate(password ?? '') ? user : null;
    print('Validation = ${result ?? "null"}');

    return result;
  });

  // Middleware to decode JWT's and inject a user object...
  await app.configure(auth.configureServer);

  // Only authenticated users can access /secret.html.
  // Place an auth guard in front of it, to deny guests from
  // viewing critical content.
  app.get('/secret.html', requireAuthentication<User>());

  // In addition, already logged in users should be sent home when they try log in again.
  app.get('/login.html', (req, res) {
    if (req.container?.has<User>() ?? false) {
      res.redirect('/');
    } else {
      return true;
    }
  });

  // Create a /login POST endpoint; it'll log a user in, and redirect to /secret.html.
  app.post(
    '/login',
    auth.authenticate(
      'local',
      AngelAuthOptions<User>(successRedirect: '/secret.html'),
    ),
  );

  // The rest of the interface consists of static files; serve them.
  app.fallback(vDir.handleRequest);
  app.fallback((req, res) => throw AngelHttpException.notFound());

  // Error handling.
  var oldHandler = app.errorHandler;

  app.errorHandler = (e, req, res) {
    if (e.statusCode == 401) {
      return res.redirect('/login.html');
    } else if (e.statusCode == 403) {
      return res.redirect('/forbidden.html');
    } else {
      if (e.statusCode == 500) print('Fatal: ${e.error}\n${e.stackTrace}');
      return oldHandler(e, req, res);
    }
  };

  // Add logging.
  app.logger = Logger('auth')
    ..onRecord.listen((rec) {
      print(rec);
      if (rec.error != null) print(rec.error);
      if (rec.stackTrace != null) print(rec.stackTrace);
    });

  // Mount the server.
  var http = AngelHttp(app);
  await http.startServer('127.0.0.1', 3000);
  print('Auth Listening at http://127.0.0.1:3000');
}
