import 'dart:io';
import 'package:dchan/src/pretty_logging.dart';
import 'package:dchan/dchan.dart';
import 'package:angel_container/mirrors.dart';
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_hot/angel_hot.dart';
import 'package:logging/logging.dart';

main() async {
  // Watch the config/ and web/ directories for changes, and hot-reload the server.
  var hot = new HotReloader(() async {
    var app = new Angel(reflector: MirrorsReflector());
    await app.configure(configureServer);
    hierarchicalLoggingEnabled = true;
    app.logger = new Logger('angel');
    var sub = app.logger.onRecord.listen(prettyLog);
    app.shutdownHooks.add((_) => sub.cancel());
    return app;
  }, [
    new Directory('config'),
    new Directory('lib'),
  ]);

  var server = await hot.startServer('127.0.0.1', 3000);
  print(
      'dchan server listening at http://${server.address.address}:${server.port}');
}
