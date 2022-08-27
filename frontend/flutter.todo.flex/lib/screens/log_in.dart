import 'package:flutter/material.dart';
import 'package:flutter_todo/Constants.dart';
import 'package:flutter_todo/info_store.dart';
import 'package:profanity_filter/profanity_filter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo/components/app_bar.dart';
import 'package:flutter_todo/realm/app_services.dart';
import 'package:realm/realm.dart';
import 'package:sizer/sizer.dart';

import '../realm/schemas.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _logIn = true;
  String? _errorMessage;

  void _setLogInSignUpState() {
    setState(() {
      _logIn = !_logIn;
    });
  }

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filter = ProfanityFilter();
    final app = Provider.of<AppServices>(context);
    void _logInUser() async {
      setState(() {
        _errorMessage = null;
      });
      try {
        setEmail(_emailController.text);
        setName(_nameController.text);
        await app.logInUserEmailPw(
            _emailController.text, _passwordController.text);
        Navigator.pushNamed(context, '/redirect');
      } catch (err) {
        setState(() {
          _errorMessage = err.toString();
          bool x = false;
          _errorMessage = err.toString();
          switch (_errorMessage) {
            case "RealmException: invalid username":
              {
                _errorMessage = "Invalid username.";
                x = true;
              }
              break;
            case "RealmException: invalid username/password":
              {
                _errorMessage = "Invalid username/password.";
                x = true;
              }
              break;
            case "RealmException: name already in use":
              {
                _errorMessage = "Email taken.";
                x = true;
              }
              break;
            case "RealmException: password must be between 6 and 128 characters":
              {
                _errorMessage =
                    "Password must be between 6 and 128 characters.";
                x = true;
              }
              break;
          }
          if (x == false) {
            _errorMessage =
                "Error, please try again. Check your email and password.";
          }
        });
      }
    }

    void _signUpUser() async {
      setState(() {
        _errorMessage = null;
      });
      if (filter.hasProfanity(_nameController.text)) {
        setState(() {
          _errorMessage = "Watch your language.";
        });
      } else {
        try {
          await app.registerUserEmailPw(
              _emailController.text, _passwordController.text);
          setName(_nameController.text);
          _logInUser();
          //Navigator.pushNamed(context, '/redirect');
        } catch (err) {
          setState(() {
            bool x = false;
            _errorMessage = err.toString();
            switch (_errorMessage) {
              case "RealmException: invalid username":
                {
                  _errorMessage = "Invalid username.";
                  x = true;
                }
                break;
              case "RealmException: invalid username/password":
                {
                  _errorMessage = "Invalid username/password.";
                  x = true;
                }
                break;
              case "RealmException: name already in use":
                {
                  _errorMessage = "Email taken.";
                  x = true;
                }
                break;
              case "RealmException: password must be between 6 and 128 characters":
                {
                  _errorMessage =
                      "Password must be between 6 and 128 characters.";
                  x = true;
                }
                break;
            }
            if (x == false) {
              _errorMessage =
                  "Error, please try again. Check your email and password.";
            }
            //TODO
            // realm?.write(() {
            //   final newSchedule = user_info(
            //       ObjectId(),
            //       "no summary",
            //       currentUser!.id,
            //       name,
            //       email,
            //       periodOneCourse,
            //       periodTwoCourse,
            //       periodThreeCourse,
            //       periodFourCourse,
            //       periodFiveCourse,
            //       periodSixCourse,
            //       periodOneTeacher,
            //       periodTwoTeacher,
            //       periodThreeTeacher,
            //       periodFourTeacher,
            //       periodFiveTeacher,
            //       periodSixTeacher,
            //       "true");
            //   realm.add<user_info>(newSchedule);
            // });

            //RealmException : invalid username
            //RealmException : invalid username/password
          });
          //_logInUser();
        }
      }
    }

    return Scaffold(
        appBar: const TodoAppBar(),
        backgroundColor: Color.fromARGB(255, 226, 226, 226),
        body: Sizer(builder: (context, orientation, deviceType) {
          return Container(
            padding: EdgeInsets.all(25.sp),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 5.sp),
                      child: _errorMessage != null
                          ? Text(_errorMessage!,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Color.fromARGB(255, 116, 10, 10),
                                  fontWeight: FontWeight.bold))
                          : null),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.sp),
                      child: Text(
                        _logIn ? 'Log In' : 'Sign Up',
                        style: TextStyle(
                            fontSize: 25.sp,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 2, 116, 88)),
                      )),
                  Form(
                      child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.sp),
                        child: TextField(
                          controller: _emailController,
                          onChanged: (value) {
                            setState(() {
                              // reset error message when user starts typing
                              if (_errorMessage != null) {
                                _errorMessage = null;
                              }
                            });
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              hintText: 'Enter valid email'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15.0.sp,
                            right: 15.0.sp,
                            top: 15.sp,
                            bottom: 0.sp),
                        //padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          obscureText: true,
                          controller: _passwordController,
                          onChanged: (value) {
                            setState(() {
                              // reset error message when user starts typing
                              if (_errorMessage != null) {
                                _errorMessage = null;
                              }
                            });
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              hintText: 'Enter secure password'),
                        ),
                      ),
                      Visibility(
                          visible: !_logIn,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 15.0.sp,
                                  right: 15.0.sp,
                                  top: 15,
                                  bottom: 0.sp),
                              child: TextField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Name',
                                    hintText: 'Enter your name (First Last)'),
                              ))),
                      Container(
                        height: 10.h,
                        width: 50.w,
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 2, 116, 88),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                          onPressed: () {
                            if (!internetConnection) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                        contentPadding:
                                            EdgeInsets.fromLTRB(24, 24, 24, 24),
                                        title: Text(
                                          "Oh no!",
                                          style: HEADERTEXT,
                                        ),
                                        content: Text(
                                            "You have no internet and the app will not function. Please wait till you get connection."));
                                  });
                            } else {
                              if (_logIn) {
                                _logInUser();
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        // contentPadding: EdgeInsets.fromLTRB(
                                        //     24.sp, 50.sp, 24.sp, 50.sp),
                                        title: Text(
                                            "Are you sure? This info cannot be changed later."),
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ElevatedButton(
                                              child: Text("Yes"),
                                              onPressed: () {
                                                setState(() {
                                                  _errorMessage = null;
                                                });
                                                _signUpUser();
                                              },
                                            ),
                                            Padding(
                                                padding: EdgeInsets.all(10.sp)),
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context, true);
                                                },
                                                child: Text("No")),
                                          ],
                                        ),
                                      );
                                    });
                              }
                            }
                          },
                          child: Text(
                            _logIn ? 'Log in' : 'Sign up',
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.sp),
                          ),
                        ),
                      ),
                    ],
                  )),
                  TextButton(
                      onPressed: _setLogInSignUpState,
                      child: Text(
                        _logIn
                            ? "New to WolfBoard? Sign up"
                            : 'Already have an account? Log in.',
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
            ),
          );
        }));
  }
}
