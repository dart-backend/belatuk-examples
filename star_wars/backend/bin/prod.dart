import 'package:angel3_container/mirrors.dart';
import 'package:angel3_production/angel3_production.dart';
import 'package:star_wars/star_wars.dart';

void main(List<String> args) =>
    Runner('star wars', configureServer, reflector: MirrorsReflector())
        .run(args);

/*
  Future<Angel> createServer() async {
    hierarchicalLoggingEnabled = true;
    var logger = Logger.detached('star_wars')
      ..onRecord.listen(star_wars.prettyLog);
    var app = Angel(logger: logger, reflector: MirrorsReflector());
    await app.configure(star_wars.configureServer);
    return app;
  }

  var hot = HotReloader(createServer, [Directory('lib')]);

  var server = await hot.startServer('127.0.0.1', 3000);
  var serverUrl =
      Uri(scheme: 'http', host: server.address.address, port: server.port);
  var graphiQLUrl = serverUrl.replace(path: '/graphiql');
  print('Listening at $serverUrl');
  print('GraphiQL endpoint: $graphiQLUrl');
  */
