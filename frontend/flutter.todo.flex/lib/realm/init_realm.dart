import 'package:realm/realm.dart';
import '../realm/schemas.dart';

Realm initRealm(User currentUser) {
  Configuration config =
      Configuration.flexibleSync(currentUser, [user_info.schema]);
  Realm realm = Realm(
    config,
  );
  final userInfo = realm.subscriptions.findByName('getUserInfo');
  if (userInfo == null) {
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm.all<user_info>(), name: 'getUserInfo');
    });
  }
  return realm;
}
