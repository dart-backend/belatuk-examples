import 'package:angel3_framework/angel3_framework.dart';
import 'package:graphql_schema2/graphql_schema2.dart';
import 'star_wars.dart';

/// Creates a GraphQL schema that manages an in-memory store of
/// Star Wars items.
GraphQLSchema createSchema(Angel app, Map<String, HookedService> services) {
  var queryType = objectType(
    'StarWarsQuery',
    description: 'A long time ago, in a galaxy far, far away...',
    fields: starWarsQueryFields(app, services),
  );

  var mutationType = objectType(
    'StarWarsMutation',
    description: 'A long time ago, in a galaxy far, far away...',
    fields: starWarsMutationFields(app, services),
  );

  return graphQLSchema(
    queryType: queryType,
    mutationType: mutationType,
  );
}
