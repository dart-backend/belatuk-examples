import 'package:angel3_migration/angel3_migration.dart';
import 'package:angel3_serialize/angel3_serialize.dart';
import 'package:angel3_orm/angel3_orm.dart';
import 'package:optional/optional.dart';
import 'attachment.dart';
part 'post.g.dart';

@serializable
@orm
abstract class _Post extends Model {
  String? get text;

  String? get userHash;

  int? get inReplyTo;

  @hasMany
  List<Attachment> get attachments;
}
