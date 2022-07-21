import 'package:realm/realm.dart';

//part 'schemas.l.dart';
part 'bugSchema.g.dart';

@RealmModel()
class _Bug {
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;
  late String bugmessage;
  late String email;
}
