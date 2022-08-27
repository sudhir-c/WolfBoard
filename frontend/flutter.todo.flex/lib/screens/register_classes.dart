import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_todo/Constants.dart';
import 'package:flutter_todo/info_store.dart';
import 'package:flutter_todo/components/row_register_class.dart';
import 'package:flutter_todo/realm/app_services.dart';

import 'package:provider/provider.dart';
import 'package:flutter_todo/realm/schemas.dart';
import 'package:realm/realm.dart';
import 'package:sizer/sizer.dart';

import '../components/app_bar.dart';

class RegisterClasses extends StatefulWidget {
  RegisterClasses({Key? key}) : super(key: key);

  @override
  RegisterClassesState createState() => RegisterClassesState();
}
// State<StatefulWidget> createState() {
//   RegisterClassesState createState() => RegisterClassesState();
//   throw UnimplementedError();
// }

class RegisterClassesState extends State<RegisterClasses> {
  bool? _checkBox = false;
  bool _userConsent = false;
  bool nameEntry = false;
  bool showLowerContent = true;
  late Future<String> username;

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<AppServices>(context).currentUser;
    final _nameController = TextEditingController();

    @override
    void dispose() {
      _nameController.dispose();
      super.dispose();
    }

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 226, 226),
        appBar: TodoAppBar(),
        body: Center(child: Consumer<Realm?>(builder: (context, realm, child) {
          if (realm == null) {
            print('realm is null');
            return Container();
          }

          username = getName(realm, context);
          username.then<void>((String value) {
            if (value == "") {
              nameEntry = true;
            } else {
              setName(value);
            }
          });
          return Sizer(builder: (context, orientation, deviceType) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: Text(
                      "Please enter your classes:",
                      style: TextStyle(
                          color: Color.fromARGB(255, 2, 116, 88),
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp),
                    ),
                  ),
                  RowRegisterClasses(periodNumber: "1"),
                  RowRegisterClasses(periodNumber: "2"),
                  RowRegisterClasses(periodNumber: "3"),
                  RowRegisterClasses(periodNumber: "4"),
                  RowRegisterClasses(periodNumber: "5"),
                  RowRegisterClasses(periodNumber: "6"),
                  Visibility(
                      visible: showLowerContent,
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                                value: _checkBox,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    _checkBox = !_checkBox!;
                                    _userConsent = !_userConsent;
                                    // realm.write(() {
                                    //       final newTodo =
                                    //           user_info(ObjectId(), name, currentUser!.id);
                                    //       realm.add<Todo>(newTodo);
                                    //     });
                                  });
                                }),
                            Column(children: [
                              Text("I consent to sharing this information"),
                              Text("to any users of this application")
                            ])
                          ],
                        ),
                        // Visibility(
                        //     visible: nameEntry,
                        //     child: Padding(
                        //         padding: EdgeInsets.only(
                        //             left: 3.sp, right: 3.sp, top: 3.sp, bottom: 0.sp),
                        //         child: TextField(
                        //           controller: _nameController,
                        //           decoration: InputDecoration(
                        //               border: OutlineInputBorder(),
                        //               labelText: 'Name',
                        //               hintText: 'Enter your name (First Last)'),
                        //         ))),
                        Padding(padding: EdgeInsets.all(5.sp)),
                        Visibility(
                            visible: _userConsent,
                            child: ElevatedButton(
                                child: Text(
                                  "Confirm my courses",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                style: DEFAULTBUTTON,
                                onPressed: () {
                                  setState(() {
                                    showLowerContent = false;
                                  });
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                            title: Text("Are you sure?"),
                                            content: Container(
                                                width: 75.w,
                                                height: 20.h,
                                                child: Column(children: [
                                                  Visibility(
                                                      visible: nameEntry,
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 0.5.sp,
                                                                  right: 0.5.sp,
                                                                  top: 0.5.sp,
                                                                  bottom:
                                                                      0.5.sp),
                                                          child: TextField(
                                                            controller:
                                                                _nameController,
                                                            decoration: InputDecoration(
                                                                border:
                                                                    OutlineInputBorder(),
                                                                labelText:
                                                                    'Enter your name (First Last)',
                                                                hintText:
                                                                    'Name'),
                                                          ))),
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.all(2.sp)),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      ElevatedButton(
                                                        child: Text("Yes"),
                                                        style: NAVBUTTON,
                                                        onPressed: () {
                                                          if (nameEntry) {
                                                            setName(
                                                                _nameController
                                                                    .text);
                                                          }
                                                          // *EXTREMELY IMPORTANT*
                                                          //This is where the user's data is sent to the
                                                          //database
                                                          //*******************************************
                                                          try {
                                                            try {
                                                              var toBeDeleted = realm
                                                                  .query<user_info>(
                                                                      'owner_id == "${currentUser?.id}"')
                                                                  .single;
                                                              realm.write(() {
                                                                realm.delete<
                                                                        user_info>(
                                                                    toBeDeleted);
                                                              });
                                                            } catch (e) {}
                                                            realm.write(() {
                                                              final newSchedule = user_info(
                                                                  ObjectId(),
                                                                  "no bugs",
                                                                  currentUser!
                                                                      .id,
                                                                  name,
                                                                  email,
                                                                  periodOneCourse,
                                                                  periodTwoCourse,
                                                                  periodThreeCourse,
                                                                  periodFourCourse,
                                                                  periodFiveCourse,
                                                                  periodSixCourse,
                                                                  periodOneTeacher,
                                                                  periodTwoTeacher,
                                                                  periodThreeTeacher,
                                                                  periodFourTeacher,
                                                                  periodFiveTeacher,
                                                                  periodSixTeacher,
                                                                  "true");
                                                              realm.add<
                                                                      user_info>(
                                                                  newSchedule);
                                                            });
                                                            dispose();
                                                            Navigator.pushNamed(
                                                                context,
                                                                '/period1');
                                                          } catch (e) {
                                                            () {
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return AlertDialog(
                                                                      content: Text(
                                                                          "Sorry, the process failed. Try again later."),
                                                                    );
                                                                  });
                                                            };
                                                          }
                                                        },
                                                      ),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  5.sp)),
                                                      ElevatedButton(
                                                          style: NAVBUTTON,
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context, true);
                                                          },
                                                          child: Text("No")),
                                                    ],
                                                  ),
                                                ])));
                                      }).then((value) {
                                    setState(() {
                                      //sleep(Duration(seconds: 1));
                                      showLowerContent = true;
                                    });
                                  });
                                })),
                        Padding(padding: EdgeInsets.all(5.sp)),
                        ElevatedButton(
                          onPressed: () {
                            dispose();
                            Navigator.pushNamed(context, '/redirect');
                          },
                          child: Text("Cancel"),
                          style: NAVBUTTON,
                        )
                      ])),
                ]);
          });
        })));
  }
}
