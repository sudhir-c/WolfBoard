import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/register_classes.dart';
import '../components/todo_list.dart';
import '../components/create_todo.dart';
import '../components/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterClasses(),
      backgroundColor: Color.fromARGB(255, 168, 168, 168),
      //floatingActionButton: CreateTodo(),
      // body: Center(
      //     child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: const <Widget>[
      //       Text(
      //         'Enter your name',
      //       )
      //     ])),
    );
  }
}
