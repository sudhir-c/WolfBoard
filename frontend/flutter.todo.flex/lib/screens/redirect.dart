import 'package:flutter/material.dart';
import 'package:flutter_todo/Constants.dart';
import 'package:flutter_todo/info_store.dart';
import 'package:flutter_todo/components/row_register_class.dart';
import 'package:flutter_todo/realm/app_services.dart';

import 'package:provider/provider.dart';
import 'package:flutter_todo/realm/schemas.dart';
import 'package:realm/realm.dart';

class Redirect extends StatelessWidget {
  Redirect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<AppServices>(context).currentUser;
    Future<String> m(Realm realm) {
      return isUserDataUploaded(realm, 'owner_id == "${currentUser?.id}"');
    }

    //Future<bool> scheduleUploaded = isUserDataUploaded(realm, 'owner_id == "${currentUser?.id}"');
    return Scaffold(
        body: Center(child: Consumer<Realm?>(builder: (context, realm, child) {
      final realm = Provider.of<Realm?>(context);
      if (realm == null) {
        return Container();
      }
      Future<String> scheduleUploaded = m(realm);
      scheduleUploaded.then<void>((String value) {
        if (value == "true") {
          Navigator.pushNamed(context, '/period1');
        } else {
          Navigator.pushNamed(context, '/default');
        }
      });
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Loading",
            style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
          )
        ],
      );
    })));
  }
}
