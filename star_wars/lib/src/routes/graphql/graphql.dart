import 'package:angel3_framework/angel3_framework.dart';
import 'package:angel3_graphql/angel3_graphql.dart';
import 'package:graphql_server2/graphql_server2.dart';
import 'schema.dart';

/// Configures the [app] to server GraphQL.
Future<void> configureServer(Angel app) async {
  // Create standard Angel services. Note that these will also *automatically* be
  // exposed via a REST API as well.
  Map<String, HookedService> services = {};
  services['droidService'] = app.use('/api/droids', MapService());
  services['humanService'] = app.use('/api/humans', MapService());
  services['starshipService'] = app.use('/api/starships', MapService());

  // Create a [GraphQL] service instance, using our schema.
  var schema = createSchema(app, services);
  var graphQL = GraphQL(schema);

  // Mount a handler that responds to GraphQL queries.
  app.all('/graphql', graphQLHttp(graphQL));

  // Generate test data
  Future<void> populateTestData(HookedService humansService) async {
    var leia = await humansService.create({
      'name': 'Leia Organa',
      'appears_in': ['NEWHOPE', 'EMPIRE', 'JEDI'],
      'total_credits': 520,
    });

    var lando = await humansService.create({
      'name': 'Lando Calrissian',
      'appears_in': ['EMPIRE', 'JEDI'],
      'total_credits': 525430,
    });

    var hanSolo = await humansService.create({
      'name': 'Han Solo',
      'appears_in': ['NEWHOPE', 'EMPIRE', 'JEDI'],
      'total_credits': 23,
      'friends': [leia, lando],
    });

    // Luke, of course.
    await humansService.create({
      'name': 'Luke Skywalker',
      'appears_in': ['NEWHOPE', 'EMPIRE', 'JEDI'],
      'total_credits': 682,
      'friends': [leia, hanSolo, lando],
    });
  }

  // Add test data
  var humanService = services['humanService'];
  if (humanService != null) {
    await populateTestData(humanService);
  }

  // In development, serve the GraphiQL IDE/editor.
  // More info: https://github.com/graphql/graphiql
  if (!app.environment.isProduction) {
    app.get('/graphiql', graphiQL());
  }
}
