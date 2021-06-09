import 'dart:io';
import 'package:dchan/src/pretty_logging.dart';
import 'package:dchan/dchan.dart';
import 'package:angel3_container/mirrors.dart';
import 'package:angel3_framework/angel3_framework.dart';
import 'package:angel3_hot/angel3_hot.dart';
import 'package:logging/logging.dart';

void main() async {
  // Watch the config/ and web/ directories for changes, and hot-reload the server.
  var hot = HotReloader(() async {
    var app = Angel(reflector: MirrorsReflector());
    await app.configure(configureServer);
    hierarchicalLoggingEnabled = true;
    app.logger = Logger('angel');
    var sub = app.logger!.onRecord.listen(prettyLog);
    app.shutdownHooks.add((_) => sub.cancel());
    return app;
  }, [
    Directory('config'),
    Directory('lib'),
  ]);

  var server = await hot.startServer('127.0.0.1', 3000);
  print(
      'dchan server listening at http://${server.address.address}:${server.port}');
}
