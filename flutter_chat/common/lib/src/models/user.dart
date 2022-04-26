import 'dart:convert';
import 'dart:typed_data';
import 'package:angel3_serialize/angel3_serialize.dart';
part 'user.g.dart';

@Serializable()
abstract class _User {
  @SerializableField(isNullable: false)
  String? get name;

  @SerializableField(isNullable: false)
  Uint8List? get avatarBytes;
}
