// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

/// Auto-generated from [Character].
final GraphQLObjectType characterGraphQLType = objectType(
  'Character',
  isInterface: true,
  interfaces: [],
  fields: [
    field<dynamic, dynamic>(
      'id',
      graphQLString,
      resolve: (obj, _) => obj is Character
          ? obj.id
          : obj == null
          ? null
          : throw GraphQLException.fromMessage(
              'Cannot resolve field "id" of "Character" from a value of type ${obj.runtimeType}: expected a Map or an instance of Character.',
            ),
    ),
    field<dynamic, dynamic>(
      'name',
      graphQLString,
      resolve: (obj, _) => obj is Character
          ? obj.name
          : obj == null
          ? null
          : throw GraphQLException.fromMessage(
              'Cannot resolve field "name" of "Character" from a value of type ${obj.runtimeType}: expected a Map or an instance of Character.',
            ),
    ),
  ],
);
