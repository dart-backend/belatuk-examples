import 'dart:math';

import 'package:angel3_framework/angel3_framework.dart';
import 'package:angel3_graphql/angel3_graphql.dart';
import 'package:graphql_schema2/graphql_schema2.dart';

import '../../models/droid.dart';
import '../../models/episode.dart';
import '../../models/human.dart';
import '../../models/starship.dart';

/// Find or create an in-memory Todo store.
MapService? _getStarWarsService(Angel app) {
  const key = 'starWarsService';

  // If there is already an existing singleton, return it.
  var container = app.container;
  if (container.hasNamed(key)) {
    return container.findByName<MapService>(key);
  }

  // Create an in-memory service. We will use this
  // as the backend to store Todo objects, serialized to Maps.
  var mapService = MapService();

  // Register this service as a named singleton in the app container,
  // so that we do not inadvertently create another instance.
  container.registerNamedSingleton(key, mapService);

  return mapService;
}

/// Returns fields to be inserted into the query type.
Iterable<GraphQLObjectField> starWarsQueryFields(
    Angel app, Map<String, HookedService> services) {
  var starWarsService = _getStarWarsService(app);

  if (starWarsService == null) {
    app.logger.warning('StarWarsService not found');
    return [];
  }

  // Create standard Angel services. Note that these will also *automatically* be
  // exposed via a REST API as well.
  var droidService = services['droidService'];
  var humansService = services['humanService'];
  var starshipService = services['starshipService'];

  if (droidService == null ||
      humansService == null ||
      starshipService == null) {
    app.logger.warning('StarWarsService not found');
    return [];
  }

  // A Hero can be either a Droid or Human; create a union type that represents this.
  var heroType = GraphQLUnionType('Hero', [droidGraphQLType, humanGraphQLType]);

  var rnd = Random();

  // Here, we use special resolvers to read data from our store.
  return [
    field(
      'droids',
      listOf(droidGraphQLType.nonNullable()),
      description: 'All droids in the known galaxy.',
      resolve: resolveViaServiceIndex(droidService),
    ),
    field(
      'humans',
      listOf(humanGraphQLType.nonNullable()),
      description: 'All humans in the known galaxy.',
      resolve: resolveViaServiceIndex(humansService),
    ),
    field(
      'starships',
      listOf(starshipGraphQLType.nonNullable()),
      description: 'All starships in the known galaxy.',
      resolve: resolveViaServiceIndex(starshipService),
    ),
    field(
      'hero',
      heroType,
      description:
          'Finds a random hero within the known galaxy, whether a Droid or Human.',
      inputs: [
        GraphQLFieldInput('ep', episodeGraphQLType),
      ],
      resolve: randomHeroResolver(droidService, humansService, rnd),
    ),
  ];
}

/// Returns fields to be inserted into the query type.
Iterable<GraphQLObjectField> starWarsMutationFields(
    Angel app, Map<String, HookedService> services) {
  var starWarsService = _getStarWarsService(app);

  if (starWarsService == null) {
    app.logger.warning('StarWarsService not found');
    return [];
  }

  var humansService = services['humanService'];

  if (humansService == null) {
    app.logger.warning('StarWarsService not found');
    return [];
  }
  var humanChangesType = humanGraphQLType.toInputObject('HumanChanges');

  // This time, we use resolvers to modify the data in the store.
  return [
    // We'll use the `modify_human` mutation to modify a human in the database.
    field(
      'modify_human',
      humanGraphQLType.nonNullable(),
      description: 'Modifies a human in the database.',
      inputs: [
        GraphQLFieldInput('id', graphQLId.nonNullable()),
        GraphQLFieldInput('data', humanChangesType.nonNullable()),
      ],
      resolve: resolveViaServiceModify(humansService),
    ),
  ];
}

GraphQLFieldResolver randomHeroResolver(
    Service droidService, Service humansService, Random rnd) {
  return (_, args) async {
    var allHeroes = [];
    var allDroids = await droidService.index();
    var allHumans = await humansService.index();
    allHeroes
      ..addAll(allDroids)
      ..addAll(allHumans);

    // Ignore the annoying cast here, hopefully Dart 2 fixes cases like this
    allHeroes = allHeroes
        .where((m) =>
            !args.containsKey('ep') ||
            (m['appears_in'].contains(args['ep']) as bool))
        .toList();

    return allHeroes.isEmpty ? null : allHeroes[rnd.nextInt(allHeroes.length)];
  };
}
