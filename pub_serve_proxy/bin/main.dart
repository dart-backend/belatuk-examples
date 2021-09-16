import 'dart:async';
import 'package:angel3_framework/angel3_framework.dart';
import 'package:angel3_production/angel3_production.dart';
import 'package:angel3_proxy/angel3_proxy.dart';
import 'package:angel3_static/angel3_static.dart';
import 'package:file/local.dart';
import 'package:http/io_client.dart' as http;

void main(List<String> args) =>
    Runner('proxy-serve', configureServer).run(args);

Future configureServer(Angel app) async {
  // In development, proxy to localhost:8080 (pub serve).
  //
  // The proxy also supports WebSockets, so it works with webpack-dev-server, etc.
  if (!app.environment.isProduction) {
    var proxy = Proxy(
      Uri.parse('http://localhost:8080'),
      httpClient: http.IOClient(),
      recoverFrom404: false,
      recoverFromDead: false,
    );

    app
      ..fallback(proxy.handleRequest)
      ..shutdownHooks.add((_) => proxy.close());
  } else {
    // In production, serve files from build/web.
    var fs = LocalFileSystem();
    var vDir = VirtualDirectory(app, fs, source: fs.directory('build/web'));
    app.fallback(vDir.handleRequest);
  }

  // Throw a 404 if no route was matched.
  app.fallback((req, res) => throw AngelHttpException.notFound());
}
