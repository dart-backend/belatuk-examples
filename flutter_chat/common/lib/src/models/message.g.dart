// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Message implements _Message {
  Message({required this.user, this.imageBytes, this.text, this.timestamp});

  @override
  User? user;

  @override
  Uint8List? imageBytes;

  @override
  String? text;

  @override
  DateTime? timestamp;

  Message copyWith(
      {User? user, Uint8List? imageBytes, String? text, DateTime? timestamp}) {
    return Message(
        user: user ?? this.user,
        imageBytes: imageBytes ?? this.imageBytes,
        text: text ?? this.text,
        timestamp: timestamp ?? this.timestamp);
  }

  @override
  bool operator ==(other) {
    return other is _Message &&
        other.user == user &&
        ListEquality().equals(other.imageBytes, imageBytes) &&
        other.text == text &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return hashObjects([user, imageBytes, text, timestamp]);
  }

  @override
  String toString() {
    return 'Message(user=$user, imageBytes=$imageBytes, text=$text, timestamp=$timestamp)';
  }

  Map<String, dynamic> toJson() {
    return MessageSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const MessageSerializer messageSerializer = MessageSerializer();

class MessageEncoder extends Converter<Message, Map> {
  const MessageEncoder();

  @override
  Map convert(Message model) => MessageSerializer.toMap(model);
}

class MessageDecoder extends Converter<Map, Message> {
  const MessageDecoder();

  @override
  Message convert(Map map) => MessageSerializer.fromMap(map);
}

class MessageSerializer extends Codec<Message, Map> {
  const MessageSerializer();

  @override
  MessageEncoder get encoder => const MessageEncoder();
  @override
  MessageDecoder get decoder => const MessageDecoder();
  static Message fromMap(Map map) {
    if (map['user'] == null) {
      throw FormatException("Missing required field 'user' on Message.");
    }

    return Message(
        user: map['user'] != null
            ? UserSerializer.fromMap(map['user'] as Map)
            : null,
        imageBytes: map['image_bytes'] is Uint8List
            ? (map['image_bytes'] as Uint8List)
            : (map['image_bytes'] is Iterable<int>
                ? Uint8List.fromList(
                    (map['image_bytes'] as Iterable<int>).toList())
                : (map['image_bytes'] is String
                    ? Uint8List.fromList(
                        base64.decode(map['image_bytes'] as String))
                    : null)),
        text: map['text'] as String?,
        timestamp: map['timestamp'] != null
            ? (map['timestamp'] is DateTime
                ? (map['timestamp'] as DateTime)
                : DateTime.parse(map['timestamp'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_Message? model) {
    if (model == null) {
      return {};
    }
    return {
      'user': UserSerializer.toMap(model.user),
      'image_bytes':
          model.imageBytes != null ? base64.encode(model.imageBytes!) : null,
      'text': model.text,
      'timestamp': model.timestamp?.toIso8601String()
    };
  }
}

abstract class MessageFields {
  static const List<String> allFields = <String>[
    user,
    imageBytes,
    text,
    timestamp
  ];

  static const String user = 'user';

  static const String imageBytes = 'image_bytes';

  static const String text = 'text';

  static const String timestamp = 'timestamp';
}
