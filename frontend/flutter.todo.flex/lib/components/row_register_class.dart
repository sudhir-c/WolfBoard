import 'package:flutter/material.dart';
import 'package:flutter_todo/Constants.dart';
import 'package:flutter_todo/info_store.dart';
import 'package:flutter_todo/realm/app_services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo/realm/schemas.dart';
import 'package:realm/realm.dart';

class RowRegisterClasses extends StatefulWidget {
  final String periodNumber;
  //info_store infoStore;

  const RowRegisterClasses({Key? key, required this.periodNumber})
      : super(key: key);

  RowRegisterClassState createState() => RowRegisterClassState(periodNumber);
}

class RowRegisterClassState extends State<RowRegisterClasses> {
  final String periodNumber;
  RowRegisterClassState(this.periodNumber);

  String? courseDropdown = "Select a course";
  String? staffDropdown = "Select a teacher";

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
          padding: EdgeInsets.fromLTRB(8, 0, 0, 8),
          child: Row(children: [
            Text(
              periodNumber,
              style: TextStyle(fontSize: 10),
            ),
            Padding(padding: EdgeInsets.all(8)),
            DropdownButton<String>(
                hint: Text("Course"),
                value: courseDropdown,
                style: TextStyle(
                    fontSize: 10, color: Color.fromARGB(255, 0, 0, 0)),
                items: COURSES.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    courseDropdown = newValue;
                    setClass(periodNumber, newValue!);
                  });
                }),
            DropdownButton<String>(
              hint: Text("Teacher"),
              value: staffDropdown,
              style:
                  TextStyle(fontSize: 10, color: Color.fromARGB(255, 0, 0, 0)),
              items: STAFF.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  staffDropdown = newValue;
                  setTeacher(periodNumber, newValue!);
                });
              },
            )
          ]))
    ]);
  }
}
