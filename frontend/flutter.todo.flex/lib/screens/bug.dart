import 'package:flutter/material.dart';
import 'package:flutter_todo/Constants.dart';
import 'package:flutter_todo/info_store.dart';
import 'package:flutter_todo/components/row_register_class.dart';
import 'package:flutter_todo/realm/app_services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo/realm/schemas.dart';
import 'package:realm/realm.dart';

import '../components/app_bar.dart';

class Bug extends StatefulWidget {
  Bug({Key? key}) : super(key: key);

  @override
  BugState createState() => BugState();
}

class BugState extends State<Bug> {
  final _bugController = TextEditingController();
  var submitVisible = false;

  void dispose() {
    _bugController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<AppServices>(context).currentUser;
    // var config = Configuration.local([bugSchema.schema]);
    // var realm = Realm(config);
    return Center(child: Consumer<Realm?>(builder: (context, realm, child) {
      return Scaffold(
          backgroundColor: Color.fromARGB(255, 226, 226, 226),
          appBar: TodoAppBar(),
          body: Padding(
              padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
              child: Column(
                children: [
                  Text(
                      "Sorry for the inconvenience! Please let us know what went wrong.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromARGB(255, 60, 0, 0), fontSize: 24)),
                  Padding(padding: EdgeInsets.all(8)),
                  TextField(
                      // minLines: null,
                      // maxLines: null,
                      // expands: true,
                      maxLines: 6,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Issue',
                          hintText:
                              'Please describe your error or bug in detail'),
                      controller: _bugController,
                      onChanged: (value) {
                        setState(() {
                          submitVisible = true;
                        });
                      }),
                  Padding(padding: EdgeInsets.all(4)),
                  Visibility(
                      visible: submitVisible,
                      child: Container(
                        height: 45,
                        width: 120,
                        margin: const EdgeInsets.symmetric(vertical: 25),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 2, 116, 88),
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                          onPressed: () {
                            try {
                              realm?.write(() async {
                                realm
                                    .query<user_info>(
                                        'owner_id == "${currentUser?.id}"')
                                    .last
                                    .summary = _bugController.text;
                              });
                            } catch (e) {
                              () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text(
                                            "Sorry, your bug was unable to go through. Please contact us through our Instagram or email."),
                                      );
                                    });
                              };
                            }
                            ;
                            dispose();
                            Navigator.pushNamed(context, '/redirect');
                          },
                          child: Text(
                            "Submit",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                        ),
                      )),
                  Padding(padding: EdgeInsets.all(5)),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/redirect'),
                    child: Text("Cancel"),
                    style: NAVBUTTON,
                  )
                ],
              )));
    }));
  }
}
