import 'package:flutter/material.dart';
import 'package:flutter_todo/Constants.dart';
import 'package:flutter_todo/info_store.dart';
import 'package:flutter_todo/components/row_register_class.dart';
import 'package:flutter_todo/realm/app_services.dart';

import 'package:provider/provider.dart';
import 'package:flutter_todo/realm/schemas.dart';
import 'package:realm/realm.dart';

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

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<AppServices>(context).currentUser;
    return Scaffold(
        appBar: TodoAppBar(),
        body: Center(child: Consumer<Realm?>(builder: (context, realm, child) {
          return Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(8)),
              Text(
                "Please enter your classes:",
                style: TextStyle(
                    color: Color.fromARGB(255, 2, 116, 88),
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              RowRegisterClasses(periodNumber: "1"),
              RowRegisterClasses(periodNumber: "2"),
              RowRegisterClasses(periodNumber: "3"),
              RowRegisterClasses(periodNumber: "4"),
              RowRegisterClasses(periodNumber: "5"),
              RowRegisterClasses(periodNumber: "6"),
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
              Visibility(
                  visible: _userConsent,
                  child: ElevatedButton(
                      child: Text(
                        "Confirm my courses",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      style: DEFAULTBUTTON,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                contentPadding:
                                    EdgeInsets.fromLTRB(24, 50, 24, 50),
                                title: Text("Are you sure?"),
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      child: Text("Yes"),
                                      style: NAVBUTTON,
                                      onPressed: () {
                                        // *EXTREMELY IMPORTANT*
                                        //This is where the user's data is sent to the
                                        //database
                                        //*******************************************
                                        try {
                                          try {
                                            var toBeDeleted = realm
                                                ?.query<user_info>(
                                                    'owner_id == "${currentUser?.id}"')
                                                .single;
                                            realm?.write(() {
                                              realm.delete<user_info>(
                                                  toBeDeleted!);
                                            });
                                          } catch (e) {}
                                          realm?.write(() {
                                            final newSchedule = user_info(
                                                ObjectId(),
                                                "no summary",
                                                currentUser!.id,
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
                                            realm.add<user_info>(newSchedule);
                                          });
                                          Navigator.pushNamed(
                                              context, '/period1');
                                        } catch (e) {
                                          () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        "Sorry, no internet connection. Try again later."),
                                                  );
                                                });
                                          };
                                        }
                                      },
                                    ),
                                    Padding(padding: EdgeInsets.all(10)),
                                    ElevatedButton(
                                        style: NAVBUTTON,
                                        onPressed: () {
                                          Navigator.pop(context, true);
                                        },
                                        child: Text("No")),
                                  ],
                                ),
                              );
                            });
                      }))
            ],
          );
        })));
  }
}
