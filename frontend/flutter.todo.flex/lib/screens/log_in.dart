import 'package:flutter/material.dart';
import 'package:flutter_todo/info_store.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo/components/app_bar.dart';
import 'package:flutter_todo/realm/app_services.dart';

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
        });
      }
    }

    void _signUpUser() async {
      setState(() {
        _errorMessage = null;
      });
      try {
        await app.registerUserEmailPw(
            _emailController.text, _passwordController.text);
        setName(_nameController.text);
        Navigator.pushNamed(context, '/login');
      } catch (err) {
        setState(() {
          _errorMessage = err.toString();
        });
      }
    }

    return Scaffold(
      appBar: const TodoAppBar(),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    _logIn ? 'Log In' : 'Sign Up',
                    style: const TextStyle(fontSize: 25),
                  )),
              Form(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
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
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
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
                      //visible: !_logIn,
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15, bottom: 0),
                          child: TextField(
                            controller: _nameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Name',
                                hintText: 'Enter your name (First Last)'),
                          ))),
                  Container(
                    height: 50,
                    width: 250,
                    margin: const EdgeInsets.symmetric(vertical: 25),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        if (_logIn) {
                          _logInUser();
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(24, 50, 24, 50),
                                  title: Text(
                                      "Are you sure? This info cannot be changed later."),
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        child: Text("Yes"),
                                        onPressed: () {
                                          _signUpUser();
                                        },
                                      ),
                                      Padding(padding: EdgeInsets.all(10)),
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
                      },
                      child: Text(
                        _logIn ? 'Log in' : 'Sign up',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              )),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: _errorMessage != null
                      ? Text(_errorMessage!,
                          style: const TextStyle(color: Colors.red))
                      : null),
              TextButton(
                  onPressed: _setLogInSignUpState,
                  child: Text(
                    _logIn
                        ? "New to WolfBoard? Sign up"
                        : 'Already have an account? Log in.',
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
