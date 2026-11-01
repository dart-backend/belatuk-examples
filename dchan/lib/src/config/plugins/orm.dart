import 'dart:async';
import 'dart:io';

import 'package:angel3_framework/angel3_framework.dart';
import 'package:angel3_orm/angel3_orm.dart';
import 'package:angel3_orm_postgres/angel3_orm_postgres.dart';
import 'package:postgres/postgres.dart';

Future<void> configureServer(Angel app) async {
  var connector = await pooledPostgresConnections(app.configuration);
  // A pool of connections, run by `PostgreSqlExecutor`, which takes any
  // session. `PostgreSqlPoolExecutor` of `angel3_orm_postgres` 10.0.1 and
  // earlier fails to insert with `angel3_orm` 10.
  var executor = PostgreSqlExecutor(connector, logger: app.logger);

  app
    ..container.registerSingleton<QueryExecutor>(executor)
    ..shutdownHooks.add((_) => connector.close());
}

Future<Pool<dynamic>> pooledPostgresConnections(Map configuration) async {
  var postgresConfig = configuration['postgres'] as Map? ?? {};
  return Pool.withEndpoints(
    [
      Endpoint(
        host: postgresConfig['host'] as String? ?? 'localhost',
        port: postgresConfig['port'] as int? ?? 5432,
        database:
            postgresConfig['database_name'] as String? ??
            Platform.environment['USER'] ??
            Platform.environment['USERNAME'] ??
            '',
        username: postgresConfig['username'] as String?,
        password: postgresConfig['password'] as String?,
      ),
    ],
    settings: PoolSettings(
      maxConnectionAge: Duration(hours: 1),
      maxConnectionCount: 20,
      connectTimeout: Duration(
        seconds: postgresConfig['timeout_in_seconds'] as int? ?? 30,
      ),
      timeZone: postgresConfig['time_zone'] as String? ?? 'UTC',
      sslMode: SslMode.disable,
    ),
  );
}

Future<Connection> postgresConnection(Map configuration) async {
  var postgresConfig = configuration['postgres'] as Map? ?? {};
  return Connection.open(
    Endpoint(
      host: postgresConfig['host'] as String? ?? 'localhost',
      port: postgresConfig['port'] as int? ?? 5432,
      database:
          postgresConfig['database_name'] as String? ??
          Platform.environment['USER'] ??
          Platform.environment['USERNAME'] ??
          '',
      username: postgresConfig['username'] as String?,
      password: postgresConfig['password'] as String?,
    ),
    settings: PoolSettings(
      maxConnectionAge: Duration(hours: 1),
      maxConnectionCount: 20,
      connectTimeout: Duration(
        seconds: postgresConfig['timeout_in_seconds'] as int? ?? 30,
      ),
      timeZone: postgresConfig['time_zone'] as String? ?? 'UTC',
      sslMode: SslMode.disable,
    ),
  );
}
