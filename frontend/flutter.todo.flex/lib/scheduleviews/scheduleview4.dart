import 'package:flutter/material.dart';
import 'package:flutter_todo/components/row_register_class.dart';
import 'package:flutter_todo/info_store.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo/components/app_bar.dart';
import 'package:flutter_todo/realm/app_services.dart';
import 'package:realm/realm.dart';

import '../Constants.dart';
import '../components/schedule_view_header.dart';

class ScheduleView4 extends StatefulWidget {
  ScheduleView4({Key? key}) : super(key: key);
  @override
  ScheduleView4State createState() => ScheduleView4State();
}

class ScheduleView4State extends State<ScheduleView4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 226, 226),
      appBar: TodoAppBar(),
      body: ScheduleViewHeader(period: "4"),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: NAVBUTTON,
              onPressed: () {
                Navigator.pushNamed(context, '/period3');
              },
              child: Text("Previous period")),
          Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
              style: NAVBUTTON,
              onPressed: () {
                Navigator.pushNamed(context, '/period5');
              },
              child: Text("Next period"))
        ],
      ),
    );
  }
}
