import 'package:realm/realm.dart';
import '../realm/schemas.dart';
import '../realm/bugSchema.dart';

Realm initRealm(User currentUser) {
  Configuration config =
      Configuration.flexibleSync(currentUser, [user_info.schema]);
  Realm realm = Realm(
    config,
  );
  final userInfo = realm.subscriptions.findByName('getUserInfo');
  // // final bugSchemasub = realm.subscriptions.findByName('');
  // if (bugSchemasub == null) {
  //   realm.subscriptions.update((mutableSubscriptions) {
  //     mutableSubscriptions.add(realm.all<bugSchema>(), name: '');
  //   });
  // }
  if (userInfo == null) {
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm.all<user_info>(), name: 'getUserInfo');
    });
  }
  return realm;
}
