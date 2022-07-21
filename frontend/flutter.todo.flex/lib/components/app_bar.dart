// ignore_for_file: prefer_const_constructors
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:flutter_todo/realm/app_services.dart';

class TodoAppBar extends StatelessWidget with PreferredSizeWidget {
  const TodoAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppServices>(context);

    Future<void> logOut() async {
      await app.logOutUser();
      Navigator.pushNamed(context, '/login');
    }

    void goToBug() {
      Navigator.pushNamed(context, "/bug");
    }

    void goToEditSchedule() {
      Navigator.pushNamed(context, '/');
    }

    //var imgfile = File('wolfboard/frontend/flutter.todo.flex/lib/logo.jpg');
    // var uri = UrlInputElement();
    var image;
    BoxConstraints? constr = BoxConstraints.tight(Size.square(130));
    try {
      image = Image.network(
          "https://wolfboardimages.files.wordpress.com/2022/07/logo-1.jpg?w=959&zoom=2",
          scale: 0.1);
    } catch (e) {
      image = Text(
        "WolfBoard",
        style: TextStyle(color: Colors.black),
      );
      constr = null;
    }
    ;
    return AppBar(
        title: Container(constraints: constr, child: image),
        automaticallyImplyLeading: false,
        actions: app.currentUser != null
            ? <Widget>[
                //Text("Bugs/Issues"),
                IconButton(
                  onPressed: goToBug,
                  icon: const Icon(Icons.bug_report),
                  tooltip: 'Bug Report Icon',
                  color: Color.fromARGB(255, 2, 116, 88),
                ),
                //Text("Logout"),
                IconButton(
                  icon: const Icon(Icons.logout),
                  tooltip: 'Log Out Icon',
                  onPressed: logOut,
                  color: Color.fromARGB(255, 2, 116, 88),
                ),

                IconButton(
                  icon: const Icon(Icons.draw),
                  tooltip: 'Edit Schedule Icon',
                  onPressed: goToEditSchedule,
                  color: Color.fromARGB(255, 2, 116, 88),
                )
              ]
            : null);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
