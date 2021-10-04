import 'package:graphql_schema2/graphql_schema2.dart';
//import 'episode.dart';
part 'character.g.dart';

@graphQLClass
abstract class Character {
  String? get id;

  String? get name;

  // List<Episode> get appearsIn;
}
