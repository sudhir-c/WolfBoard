import 'package:flutter/material.dart';
import 'package:flutter_todo/Constants.dart';
import 'package:flutter_todo/screens/register_classes.dart';
import 'package:sizer/sizer.dart';
import '../components/todo_list.dart';
import '../components/create_todo.dart';
import '../components/app_bar.dart';

class Default extends StatelessWidget {
  const Default({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 226, 226),
        appBar: TodoAppBar(),
        body: Sizer(builder: (context, orientation, deviceType) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    child: Text("Click to input classes"),
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 2, 116, 88)),
                        shadowColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 0, 0, 0)),
                        textStyle: MaterialStateProperty.all(TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 24.sp))),
                  )
                ])
              ]);
        }));
  }
}
