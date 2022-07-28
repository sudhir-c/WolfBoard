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
  bool nameEntry = false;
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

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  visible: nameEntry,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: 12.0, right: 12.0, top: 12, bottom: 0),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                            hintText: 'Enter your name (First Last)'),
                      ))),
              Padding(padding: EdgeInsets.all(10)),
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
                        setName(_nameController.text);
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
                                                .query<user_info>(
                                                    'owner_id == "${currentUser?.id}"')
                                                .single;
                                            realm.write(() {
                                              realm.delete<user_info>(
                                                  toBeDeleted!);
                                            });
                                          } catch (e) {}
                                          realm.write(() {
                                            final newSchedule = user_info(
                                                ObjectId(),
                                                "no bugs",
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
                                          dispose();
                                          Navigator.pushNamed(
                                              context, '/period1');
                                        } catch (e) {
                                          () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        "Sorry, the process failed. Try again later."),
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
                      })),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                onPressed: () {
                  dispose();
                  Navigator.pushNamed(context, '/redirect');
                },
                child: Text("Cancel"),
                style: NAVBUTTON,
              )
            ],
          );
        })));
  }
}
