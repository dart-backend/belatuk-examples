import 'package:angel3_serialize/angel3_serialize.dart';
import 'package:graphql_schema2/graphql_schema2.dart';
import 'character.dart';
import 'episode.dart';
part 'human.g.dart';

@serializable
@graphQLClass
abstract class _Human extends Model implements Character {
  // @GraphQLDocumentation(description: "This human's name, of course.")
  // String name;
  // List<Character> friends;
  // List<Episode> appearsIn;
  // List<Starship> starships;
  // int totalCredits;

  List<Episode> get appearsIn;

  List<Character> get friends;

  int? get totalCredits;

  // Human(
  //     {this.name,
  //     this.friends,
  //     this.appearsIn,
  //     this.starships,
  //     this.totalCredits});
}
