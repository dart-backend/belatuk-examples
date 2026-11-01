import 'dart:io';

import 'package:angel3_auth/angel3_auth.dart';
import 'package:angel3_framework/angel3_framework.dart';
import 'package:angel3_framework/http.dart';
import 'package:angel3_static/angel3_static.dart';
import 'package:auth/auth.dart';
import 'package:file/local.dart';
import 'package:logging/logging.dart';

void main() async {
  var app = Angel();

  // Add logging.
  app.logger = Logger('auth')
    ..onRecord.listen((rec) {
      print(rec);
      if (rec.error != null) print(rec.error);
      if (rec.stackTrace != null) print(rec.stackTrace);
    });

  // In a real application, the users are in a database.
  var users = {
    for (var user in [User('demo', 'demo123'), User('admin', 'admin123')])
      user.username: user,
  };

  // The key that signs the JWTs, which must stay secret: anyone who knows it
  // can sign a JWT for any user. Keep it out of the code, as in the JWT_SECRET
  // environment variable. Without one, a random key is used, so the logins do
  // not survive a restart of the server.
  var jwtSecret = Platform.environment['JWT_SECRET'];
  if (jwtSecret == null) {
    if (app.environment.isProduction) {
      throw StateError('Set the JWT_SECRET environment variable.');
    }
    app.logger.warning(
      'JWT_SECRET is not set: using a random key, so logins end when the '
      'server restarts.',
    );
  }

  var auth = AngelAuth<User>(
    // A JWT holds the username only, which anyone holding it can read, and
    // the user is looked up again for each request: one who no longer exists
    // is refused, with a 403.
    serializer: (user) => user.username,
    deserializer: (username) =>
        users[username] ??
        (throw AngelHttpException.forbidden(
          message: 'The user of the JWT does not exist.',
        )),
    jwtKey: jwtSecret,
    // A JWT, which cannot be revoked, is valid for an hour.
    jwtLifeSpan: const Duration(hours: 1).inMilliseconds,
    // `localhost` cannot use `Secure` cookies when it is not over HTTPS, which
    // it often is not in development.
    secureCookies: app.environment.isProduction,
  );

  // Tell the authenticator how to validate a username+password auth attempt.
  // Return `null` on a failed attempt.
  auth.strategies['local'] = LocalAuthStrategy((username, password) {
    var user = users[username];
    // Checked even when there is no such user, so that the time it takes does
    // not tell which usernames exist.
    if (User.checkPassword(user, password ?? '')) return user;
    app.logger.info('A log in failed.');
    return null;
  });

  // Middleware to decode JWT's and inject a user object...
  await app.configure(auth.configureServer);

  var fs = LocalFileSystem();

  // Only authenticated users can access /secret.html, by any method, as `HEAD`
  // too: an auth guard in front of it denies guests. It is in `protected/`,
  // not `web/`, which is cached, and is sent with `no-store`, so that neither
  // a browser nor a proxy keeps it.
  var protectedDir = VirtualDirectory(
    app,
    fs,
    source: fs.directory('protected'),
  );
  app.all(
    '/secret.html',
    chain([
      requireAuthentication<User>(),
      (req, res) {
        res.headers['cache-control'] = 'no-store';
        return protectedDir.handleRequest(req, res);
      },
    ]),
  );

  // Users who are already logged in are sent home when they try to log in
  // again. The JWT is only decoded when the user is asked for.
  app.get('/login.html', (req, res) async {
    try {
      await req.container!.makeAsync<User>();
    } on AngelHttpException {
      // A guest, or a JWT that is no longer valid: show the form.
      return true;
    }
    await res.redirect('/');
    return false;
  });

  // Create a /login POST endpoint; it'll log a user in, and redirect to /secret.html.
  app.post(
    '/login',
    auth.authenticate(
      'local',
      AngelAuthOptions<User>(successRedirect: '/secret.html'),
    ),
  );

  // Log out: the `token` cookie is removed. The JWT itself stays valid until
  // it expires, as JWTs cannot be revoked.
  app.post(
    '/logout',
    auth.logout(AngelAuthOptions<User>(successRedirect: '/')),
  );

  // The rest of the interface consists of static files; serve them.
  // `CachingVirtualDirectory` can improve page load times.
  var vDir = CachingVirtualDirectory(app, fs, source: fs.directory('web'));
  app.fallback(vDir.handleRequest);
  app.fallback((req, res) => throw AngelHttpException.notFound());

  // Error handling: a browser that is refused a page, as a guest (403), or
  // with a JWT that expired or is no longer valid, is sent to log in. Other
  // clients, as of `/auth/token`, get the error itself.
  var oldHandler = app.errorHandler;

  app.errorHandler = (e, req, res) {
    if ((e.statusCode == 401 || e.statusCode == 403) &&
        req.accepts('text/html', strict: true)) {
      return res.redirect('/login.html');
    } else {
      return oldHandler(e, req, res);
    }
  };

  // Mount the server.
  var http = AngelHttp(app);
  await http.startServer('127.0.0.1', 3000);
  print('Auth Listening at http://127.0.0.1:3000');
}
