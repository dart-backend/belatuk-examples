import 'package:angel3_serialize/angel3_serialize.dart';
import 'package:graphql_schema2/graphql_schema2.dart';
part 'starship.g.dart';

@serializable
@graphQLClass
abstract class _Starship extends Model {
  String? get name;
  int? get length;
}
