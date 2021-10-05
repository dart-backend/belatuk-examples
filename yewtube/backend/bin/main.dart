import 'package:angel3_framework/angel3_framework.dart';
import 'package:angel3_framework/http.dart';
import 'package:logging/logging.dart';
import 'package:yewtube/yewtube.dart' as yewtube;

void main() async {
  var app = Angel();
  var http = AngelHttp(app);
  app.logger = Logger('yewtube')
    ..onRecord.listen((rec) {
      print(rec);
      if (rec.error != null) print(rec.error);
      if (rec.stackTrace != null) print(rec.stackTrace);
    });

  await app.configure(yewtube.configureServer);
  await http.startServer('127.0.0.1', 3000);
  print('Yewtube listening at ${http.uri}');
}
