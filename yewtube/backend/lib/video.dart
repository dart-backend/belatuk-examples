import 'package:angel3_model/angel3_model.dart';
import 'package:angel3_serialize/angel3_serialize.dart';
part 'video.g.dart';

@serializable
abstract class _Video extends Model {
  String? get title;

  String? get description;

  String? get filePath;

  String? get mimeType;
}
