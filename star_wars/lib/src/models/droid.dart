import 'package:angel3_model/angel3_model.dart';
import 'package:angel3_serialize/angel3_serialize.dart';
import 'package:collection/collection.dart';
import 'package:graphql_schema2/graphql_schema2.dart';
import 'character.dart';
import 'episode.dart';
part 'droid.g.dart';

@serializable
@graphQLClass
@GraphQLDocumentation(description: 'Beep! Boop!')
abstract class _Droid extends Model implements Character {
  String? get id;

  String? get name;

  @GraphQLDocumentation(
      description: 'The list of episodes this droid appears in.')
  List<Episode> get appearsIn;

  /// Doc comments automatically become GraphQL descriptions.
  List<Character> get friends;
}
