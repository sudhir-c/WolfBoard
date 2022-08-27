import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/register_classes.dart';
import 'package:flutter_todo/info_store.dart';
import 'package:flutter_todo/realm/schemas.dart';
import 'package:flutter_todo/viewmodels/userinfo_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:flutter_todo/Constants.dart';
import 'package:sizer/sizer.dart';
import '../components/app_bar.dart';
import '../realm/app_services.dart';

class ScheduleViewHeader extends StatefulWidget {
  final String period;

  const ScheduleViewHeader({Key? key, required this.period}) : super(key: key);

  @override
  ScheduleViewHeaderState createState() => ScheduleViewHeaderState(period);
}

class ScheduleViewHeaderState extends State<ScheduleViewHeader> {
  final String period;

  ScheduleViewHeaderState(this.period);

  String courseName = "fetching course";
  String teacherName = "fetching teacher";
  List<String> classmates = ["fetching classmates"];

  @override
  Widget build(BuildContext context) {
    print(courseName);
    print(teacherName);
    Future<List<String>> scheduleWaiter(
        Realm realm, BuildContext context) async {
      print("IN SCHEDULEWAITER");
      return await getUserSchedule(context, period, realm);
    }

    Future<List<String>> classmateWaiter(
        Realm realm, BuildContext context) async {
      print("IN CLASSMATEWAITER");
      return await getClassmates(
          context, period, realm, courseName, teacherName);
    }

    List<Widget> classmatesToText(List<String> clasmates) {
      List<Widget> classmatesText = [];
      for (int i = 0; i < classmates.length; i++) {
        classmatesText.add(Text(
          classmates[i],
          style:
              TextStyle(fontSize: 12.sp, color: Color.fromARGB(255, 5, 48, 16)),
        ));
      }
      return classmatesText;
    }

    return Scaffold(
        body: Center(child: Consumer<Realm?>(builder: (context, realm, child) {
      //final realm = Provider.of<Realm?>(context);
      if (realm == null) {
        return Container();
      }

      // tester = realm
      //     .query<user_info>('periodFiveCourse == "Keelin Davis"')
      //     .last
      //     .periodOneCourse;
      if (courseName == "fetching course" &&
          teacherName == "fetching teacher") {
        Future<List<String>> futureschedule = scheduleWaiter(realm, context);
        //List<String> schedule =
        futureschedule.then<void>((List<String> value) {
          print("-------------------------------------------");
          print("-------------------------------------------");
          print(value);
          print("-------------------------------------------");
          print("-------------------------------------------");
          setState(() {
            print(
                "*******************Setting the state -------------------------");
            courseName = value[0];
            teacherName = value[1];
            if (classmates[0] == "fetching classmates") {
              Future<List<String>> futureclassmates =
                  classmateWaiter(realm, context);
              futureclassmates.then<void>((List<String> value) {
                print("CLASSMATES FETCHED");
                setState(() {
                  classmates = value;
                });
              });
            }
          });
          return;
        });
      }

      //TODO CLASSMATE FETCHER
      //
      // switch (period) {
      //   case "1":
      //     {
      //
      //       final queryLength = realm
      //           .query<user_info>('periodOneCourse == "' +
      //               courseName +
      //               '" AND periodOneTeacher == "' +
      //               teacherName +
      //               '"')
      //           .length;
      //       for (int i = 0; i < queryLength; i++) {
      //         classmates[i] = realm
      //             .query<user_info>('periodOneCourse == "' +
      //                 courseName +
      //                 '" AND periodOneTeacher == "' +
      //                 teacherName +
      //                 '"')
      //             .elementAt(i)
      //             .email;
      //       }
      //       print(
      //           "PASSED SWITCH CASE QUERIES ******************************");
      //     }
      //     break;
      //   case "2":
      //     {
      //       final queryLength = realm
      //           .query<user_info>('periodTwoCourse == "' +
      //               courseName +
      //               '" AND periodTwoTeacher == "' +
      //               teacherName +
      //               '"')
      //           .length;
      //       for (int i = 0; i < queryLength; i++) {
      //         classmates[i] = realm
      //             .query<user_info>('periodTwoCourse == "' +
      //                 courseName +
      //                 '" AND periodTwoTeacher == "' +
      //                 teacherName +
      //                 '"')
      //             .elementAt(i)
      //             .email;
      //       }
      //     }
      //     break;
      //   case "3":
      //     {
      //       final queryLength = realm
      //           .query<user_info>('periodThreeCourse == "' +
      //               courseName +
      //               '" AND periodThreeTeacher == "' +
      //               teacherName +
      //               '"')
      //           .length;
      //       for (int i = 0; i < queryLength; i++) {
      //         classmates[i] = realm
      //             .query<user_info>('periodThreeCourse == "' +
      //                 courseName +
      //                 '" AND periodThreeTeacher == "' +
      //                 teacherName +
      //                 '"')
      //             .elementAt(i)
      //             .email;
      //       }
      //     }
      //     break;
      //   case "4":
      //     {
      //       final queryLength = realm
      //           .query<user_info>('periodFourCourse == "' +
      //               courseName +
      //               '" AND periodFourTeacher == "' +
      //               teacherName +
      //               '"')
      //           .length;
      //       for (int i = 0; i < queryLength; i++) {
      //         classmates[i] = realm
      //             .query<user_info>('periodFourCourse == "' +
      //                 courseName +
      //                 '" AND periodFourTeacher == "' +
      //                 teacherName +
      //                 '"')
      //             .elementAt(i)
      //             .email;
      //       }
      //     }
      //     break;
      //   case "5":
      //     {
      //       final queryLength = realm
      //           .query<user_info>('periodFiveCourse == "' +
      //               courseName +
      //               '" AND periodFiveTeacher == "' +
      //               teacherName +
      //               '"')
      //           .length;
      //       for (int i = 0; i < queryLength; i++) {
      //         classmates[i] = realm
      //             .query<user_info>('periodFiveCourse == "' +
      //                 courseName +
      //                 '" AND periodFiveTeacher == "' +
      //                 teacherName +
      //                 '"')
      //             .elementAt(i)
      //             .email;
      //       }
      //     }
      //     break;
      //   case "6":
      //     {
      //       final queryLength = realm
      //           .query<user_info>('periodSixCourse == "' +
      //               courseName +
      //               '" AND periodSixTeacher == "' +
      //               teacherName +
      //               '"')
      //           .length;
      //       for (int i = 0; i < queryLength; i++) {
      //         classmates[i] = realm
      //             .query<user_info>('periodSixCourse == "' +
      //                 courseName +
      //                 '" AND periodSixTeacher == "' +
      //                 teacherName +
      //                 '"')
      //             .elementAt(i)
      //             .email;
      //       }
      //     }
      //     break;
      // }

      return Scaffold(
          backgroundColor: Color.fromARGB(255, 226, 226, 226),
          body: Padding(
            padding: EdgeInsets.all(8.sp),
            child: Column(children: [
              Text(
                "Period " + period + ": " + courseName + " with " + teacherName,
                style: HEADERTEXT,
                textAlign: TextAlign.center,
              ),
              Container(
                  height: 60.h,
                  child: Column(children: classmatesToText(classmates)))
              // Text(classmates.toString(),
              //     //classmates.toString(),
              //     style: TextStyle(fontSize: 10, color: Color.fromARGB(255, 0, 0, 0)))
            ]),
          ));

      // List<String> schedule = [];
      // List<String> classmates = [];
      // courseName = schedule[0];
      // teacherName = schedule[1];
      //Set relevant data based on which period this object is a header for

      // final stream =
      //     realm.query<user_info>('periodFiveCourse == "Keelin Davis"').changes;

      return Text("No data");
    })));
  }
}
