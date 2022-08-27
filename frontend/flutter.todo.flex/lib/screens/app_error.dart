import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class appErrorWidget extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const appErrorWidget({
    required this.errorDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 116, 88),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Oh no!",
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.h)),
          Padding(padding: EdgeInsets.all(10.sp)),
          Text(
              "Looks like there has been an error on our end. We apologize for the inconvenience.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w900,
              )),
          Padding(padding: EdgeInsets.all(10.sp)),
          Container(
              padding: EdgeInsets.all(10.sp),
              width: 65.w,
              height: 18.h,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(20)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text("Restart app"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 255, 255, 255)),
                    shadowColor:
                        MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),
                    foregroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 2, 116, 88)),
                    textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: 25.sp, fontWeight: FontWeight.w900))),
              ))
        ],
      ),
    );
  }
}
