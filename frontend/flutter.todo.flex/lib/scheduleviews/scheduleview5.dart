import 'package:flutter/material.dart';
import 'package:flutter_todo/components/row_register_class.dart';
import 'package:flutter_todo/info_store.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo/components/app_bar.dart';
import 'package:flutter_todo/realm/app_services.dart';
import 'package:realm/realm.dart';

import '../Constants.dart';
import '../components/schedule_view_header.dart';

class ScheduleView5 extends StatefulWidget {
  ScheduleView5({Key? key}) : super(key: key);
  @override
  ScheduleView5State createState() => ScheduleView5State();
}

class ScheduleView5State extends State<ScheduleView5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TodoAppBar(),
      body: ScheduleViewHeader(period: "5"),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: NAVBUTTON,
              onPressed: () {
                Navigator.pushNamed(context, '/period4');
              },
              child: Text("Previous period")),
          Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
              style: NAVBUTTON,
              onPressed: () {
                Navigator.pushNamed(context, '/period6');
              },
              child: Text("Next period"))
        ],
      ),
    );
    // body: LayoutBuilder(builder: (context, constraints) {
    //   return Scaffold(
    //       // child: LayoutBuilder(builder:
    //       //     (BuildContext context, BoxConstraints viewportConstraints) {
    //       //   return SingleChildScrollView(
    //       //       child: ConstrainedBox(
    //       //           constraints: BoxConstraints(
    //       //               minHeight: viewportConstraints.maxHeight),
    //       //           // maxHeight: viewportConstraints.maxHeight,
    //       //           // minWidth: viewportConstraints.minWidth,
    //       //           // maxWidth: viewportConstraints.maxWidth),
    //       body: Flex(direction: Axis.vertical, children: [
    //     Expanded(
    //         // mainAxisAlignment: MainAxisAlignment.center,
    //         // crossAxisAlignment: CrossAxisAlignment.center,
    //         child: Column(children: [
    //       ScheduleViewHeader(period: "1"),
    //       // ScheduleViewHeader(period: "2"),
    //       // ScheduleViewHeader(period: "3"),
    //       // ScheduleViewHeader(period: "4"),
    //       // ScheduleViewHeader(period: "5"),
    //       // ScheduleViewHeader(period: "6"),)
    //     ]))
    //   ]));
    // }));
  }
}
