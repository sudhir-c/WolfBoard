import 'package:realm/realm.dart';
import '../realm/schemas.dart';
import '../realm/bugSchema.dart';

Realm initRealm(User currentUser) {
  Configuration config =
      Configuration.flexibleSync(currentUser, [user_info.schema]);
  Realm realm = Realm(
    config,
  );
  final userInfo = realm.subscriptions.findByName('');
  // // final bugSchemasub = realm.subscriptions.findByName('');
  // if (bugSchemasub == null) {
  //   realm.subscriptions.update((mutableSubscriptions) {
  //     mutableSubscriptions.add(realm.all<bugSchema>(), name: '');
  //   });
  // }
  if (userInfo == null) {
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm.all<user_info>(), name: '');
    });
  }
  return realm;
}
