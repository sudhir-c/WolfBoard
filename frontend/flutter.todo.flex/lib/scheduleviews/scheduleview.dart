import 'package:flutter/material.dart';
import 'package:flutter_todo/components/row_register_class.dart';
import 'package:flutter_todo/info_store.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo/components/app_bar.dart';
import 'package:flutter_todo/realm/app_services.dart';
import 'package:realm/realm.dart';

import '../Constants.dart';
import '../components/schedule_view_header.dart';

class ScheduleView extends StatefulWidget {
  ScheduleView({Key? key}) : super(key: key);
  @override
  ScheduleViewState createState() => ScheduleViewState();
}

class ScheduleViewState extends State<ScheduleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 226, 226),
        appBar: TodoAppBar(),
        body: ScheduleViewHeader(period: "1"),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: NAVBUTTON,
                onPressed: () {
                  Navigator.pushNamed(context, '/period2');
                },
                child: Text("Next period"))
          ],
        ));
  }
}
