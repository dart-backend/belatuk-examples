import 'package:graphql_schema2/graphql_schema2.dart';
part 'episode.g.dart';

@GraphQLDocumentation(
    description: 'The episodes of the Star Wars original trilogy.')
@graphQLClass
enum Episode {
  NEWHOPE,
  EMPIRE,
  JEDI,
}
