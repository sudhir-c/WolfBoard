import 'package:flutter/material.dart';
import 'package:flutter_todo/Constants.dart';
import 'package:flutter_todo/info_store.dart';
import 'package:sizer/sizer.dart';

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
          padding: EdgeInsets.fromLTRB(0.5.sp, 0, 0, 0.5.sp),
          child: Row(children: [
            Text(
              periodNumber,
              style: TextStyle(fontSize: 7.sp, fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.all(2.5.sp)),
            DropdownButton<String>(
                hint: Text("Course"),
                value: courseDropdown,
                style: TextStyle(
                    fontSize: 6.sp,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold),
                items: COURSES.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(fontSize: 5.sp)),
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
              style: TextStyle(
                  fontSize: 6.sp,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold),
              items: STAFF.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(fontSize: 5.sp)),
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
