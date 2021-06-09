import 'package:angel3_migration/angel3_migration.dart';
import 'package:angel3_serialize/angel3_serialize.dart';
import 'package:angel3_orm/angel3_orm.dart';
import 'package:http_parser/http_parser.dart';
import 'package:filesize/filesize.dart';
import 'package:optional/optional.dart';
part 'attachment.g.dart';

@serializable
@orm
abstract class _Attachment extends Model {
  int? get postId;

  int? get index;

  int? sizeInBytes;

  String get size => filesize(sizeInBytes);

  String? path;

  String? filename;

  String? get contentTypeString;

  MediaType get contentType => MediaType.parse(contentTypeString!);
}
