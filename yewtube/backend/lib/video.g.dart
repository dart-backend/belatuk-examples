// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Video extends _Video {
  Video({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.description,
    this.filePath,
    this.mimeType,
  });

  /// A unique identifier corresponding to this item.
  @override
  String? id;

  /// The time at which this item was created.
  @override
  DateTime? createdAt;

  /// The last time at which this item was updated.
  @override
  DateTime? updatedAt;

  @override
  String? title;

  @override
  String? description;

  @override
  String? filePath;

  @override
  String? mimeType;

  Video copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? title,
    String? description,
    String? filePath,
    String? mimeType,
  }) {
    return Video(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      title: title ?? this.title,
      description: description ?? this.description,
      filePath: filePath ?? this.filePath,
      mimeType: mimeType ?? this.mimeType,
    );
  }

  @override
  bool operator ==(other) {
    return other is _Video &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.title == title &&
        other.description == description &&
        other.filePath == filePath &&
        other.mimeType == mimeType;
  }

  @override
  int get hashCode {
    return Object.hashAll([
      id,
      createdAt,
      updatedAt,
      title,
      description,
      filePath,
      mimeType,
    ]);
  }

  @override
  String toString() {
    return 'Video(id=$id, createdAt=$createdAt, updatedAt=$updatedAt, title=$title, description=$description, filePath=$filePath, mimeType=$mimeType)';
  }

  Map<String, dynamic> toJson() {
    return VideoSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const VideoSerializer videoSerializer = VideoSerializer();

class VideoEncoder extends Converter<Video, Map> {
  const VideoEncoder();

  @override
  Map convert(Video model) => VideoSerializer.toMap(model);
}

class VideoDecoder extends Converter<Map, Video> {
  const VideoDecoder();

  @override
  Video convert(Map map) => VideoSerializer.fromMap(map);
}

class VideoSerializer extends Codec<Video, Map> {
  const VideoSerializer();

  @override
  VideoEncoder get encoder => const VideoEncoder();

  @override
  VideoDecoder get decoder => const VideoDecoder();

  static Video fromMap(Map map) {
    return Video(
      id: map['id'] as String?,
      createdAt: map['created_at'] != null
          ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
          : null,
      updatedAt: map['updated_at'] != null
          ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
          : null,
      title: map['title'] as String?,
      description: map['description'] as String?,
      filePath: map['file_path'] as String?,
      mimeType: map['mime_type'] as String?,
    );
  }

  static Map<String, dynamic> toMap(_Video? model) {
    if (model == null) {
      throw FormatException("Required field [model] cannot be null");
    }
    return {
      'id': model.id,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String(),
      'title': model.title,
      'description': model.description,
      'file_path': model.filePath,
      'mime_type': model.mimeType,
    };
  }
}

abstract class VideoFields {
  static const List<String> allFields = <String>[
    id,
    createdAt,
    updatedAt,
    title,
    description,
    filePath,
    mimeType,
  ];

  static const String id = 'id';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';

  static const String title = 'title';

  static const String description = 'description';

  static const String filePath = 'file_path';

  static const String mimeType = 'mime_type';
}
