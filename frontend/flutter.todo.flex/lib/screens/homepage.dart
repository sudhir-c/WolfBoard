import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/register_classes.dart';
import '../components/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterClasses(),
      backgroundColor: Color.fromARGB(255, 226, 226, 226),
    );
  }
}
