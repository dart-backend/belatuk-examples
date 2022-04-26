import 'dart:convert';
import 'dart:typed_data';
import 'package:angel3_serialize/angel3_serialize.dart';
import 'user.dart';
part 'message.g.dart';

@Serializable()
abstract class _Message {
  @SerializableField(isNullable: false)
  User? get user;

  Uint8List? get imageBytes;

  String? get text;

  DateTime? get timestamp;
}
