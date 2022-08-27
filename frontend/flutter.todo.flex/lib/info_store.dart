import 'package:flutter/material.dart';
import 'package:flutter_todo/realm/app_services.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:flutter_todo/realm/schemas.dart';
import 'package:realm/realm.dart';

String _name = "";
//This function will be called when a user logs in to set their name for the rest of runtime.
Future<void> initUser(Realm realm, BuildContext context) async {
  final currentUser = Provider.of<AppServices>(context).currentUser;
  bool userRegistered =
      realm.query<user_info>('owner_id == "${currentUser?.id}"').isNotEmpty;
  if (userRegistered) {
    _name =
        realm.query<user_info>('owner_id == "${currentUser?.id}"').last.name;
  }
}

Future<String> getName(Realm realm, BuildContext context) async {
  final currentUser = Provider.of<AppServices>(context).currentUser;
  String userName = "";
  var empty = await isDBempty(realm, 'owner_id == "${currentUser?.id}"');
  if (empty) {
    return _name;
  } else {
    userName = await realm
        .query<user_info>('owner_id == "${currentUser?.id}"')
        .last
        .name;
  }
  return userName;
}

void setName(String name) {
  _name = name;
}

bool _internetConnection = true;
bool get internetConnection => _internetConnection;

void setInternetConnection(bool val) {
  _internetConnection = val;
}

String _email = "";
String _periodOneCourse = "";
String _periodTwoCourse = "";
String _periodThreeCourse = "";
String _periodFourCourse = "";
String _periodFiveCourse = "";
String _periodSixCourse = "";
String _periodOneTeacher = "";
String _periodTwoTeacher = "";
String _periodThreeTeacher = "";
String _periodFourTeacher = "";
String _periodFiveTeacher = "";
String _periodSixTeacher = "";

// var config = Configuration.local(
//   [user_info.schema],
// );
// var realm = Realm(config);

//config = Realm.Configuration(
//     // Set the new schema version. This must be greater than the previously used
//     // version (if you've never set a schema version before, the version is 0).
//     schemaVersion: 1,
//
//     // Set the block which will be called automatically when opening a Realm with
//     // a schema version lower than the one set above
//     migrationBlock: { migration, oldSchemaVersion in
//         // We haven’t migrated anything yet, so oldSchemaVersion == 0
//         if (oldSchemaVersion < 1) {
//             // Nothing to do!
//             // Realm will automatically detect new properties and removed properties
//             // And will update the schema on disk automatically
//         }
// })
//
// // Tell Realm to use this new configuration object for the default Realm
// Realm.Configuration.defaultConfiguration = config

Future<bool> isDBempty(Realm realm, String query) async {

  return realm.query<user_info>(query).isEmpty;
}

Future<String> isUserDataUploaded(Realm realm, String query) async {
  if (realm.query<user_info>(query).isEmpty) {
    return "false";
  } else {
    return "true";
    //return await realm.query<user_info>(query).last.scheduleUploaded;
  }
}

Future<RealmResults<user_info>> newDBquery(Realm realm, String query) async {
  return realm.query<user_info>(query);
}

//var config = Configuration.local([user_info.schema]);
// var config = Configuration.local([user_info.schema], schemaVersion: 1);
// var newRealm = Realm(config);
Future<List<String>> getClassmates(BuildContext context, String period,
    Realm realm, String courseName, String teacherName) async {
  bool empty = true;
  switch (period) {
    case "1":
      {
        empty = await isDBempty(
            realm,
            'periodOneCourse == "' +
                courseName +
                '" AND periodOneTeacher == "' +
                teacherName +
                '"');
      }
      break;
    case "2":
      {
        empty = await isDBempty(
            realm,
            'periodTwoCourse == "' +
                courseName +
                '" AND periodTwoTeacher == "' +
                teacherName +
                '"');
      }
      break;
    case "3":
      {
        empty = await isDBempty(
            realm,
            'periodThreeCourse == "' +
                courseName +
                '" AND periodThreeTeacher == "' +
                teacherName +
                '"');
      }
      break;
    case "4":
      {
        empty = await isDBempty(
            realm,
            'periodFourCourse == "' +
                courseName +
                '" AND periodFourTeacher == "' +
                teacherName +
                '"');
      }
      break;
    case "5":
      {
        empty = await isDBempty(
            realm,
            'periodFiveCourse == "' +
                courseName +
                '" AND periodFiveTeacher == "' +
                teacherName +
                '"');
      }
      break;
    case "6":
      {
        empty = await isDBempty(
            realm,
            'periodSixCourse == "' +
                courseName +
                '" AND periodSixTeacher == "' +
                teacherName +
                '"');
      }
      break;
  }
  if (empty) {
    return ["No classmates registered at the moment, check back later!"];
  }

  RealmResults<user_info> userSearch =
      realm.query<user_info>('periodOneCourse == "Kyle Pihl"');

  switch (period) {
    case "1":
      {
        userSearch = await newDBquery(
            realm,
            'periodOneCourse == "' +
                courseName +
                '" AND periodOneTeacher == "' +
                teacherName +
                '"');
      }
      break;
    case "2":
      {
        userSearch = await newDBquery(
            realm,
            'periodTwoCourse == "' +
                courseName +
                '" AND periodTwoTeacher == "' +
                teacherName +
                '"');
      }
      break;
    case "3":
      {
        userSearch = await newDBquery(
            realm,
            'periodThreeCourse == "' +
                courseName +
                '" AND periodThreeTeacher == "' +
                teacherName +
                '"');
      }
      break;
    case "4":
      {
        userSearch = await newDBquery(
            realm,
            'periodFourCourse == "' +
                courseName +
                '" AND periodFourTeacher == "' +
                teacherName +
                '"');
      }
      break;
    case "5":
      {
        userSearch = await newDBquery(
            realm,
            'periodFiveCourse == "' +
                courseName +
                '" AND periodFiveTeacher == "' +
                teacherName +
                '"');
      }
      break;
    case "6":
      {
        userSearch = await newDBquery(
            realm,
            'periodSixCourse == "' +
                courseName +
                '" AND periodSixTeacher == "' +
                teacherName +
                '"');
      }
      break;
  }

  int queryLength = userSearch.length;
  List<String> classmates = []; //List.empty(growable: true);

  for (int i = 0; i < queryLength; i++) {
    classmates.add(userSearch.elementAt(i).name);
  }
  return classmates;
}

Future<List<String>> getUserSchedule(
    BuildContext context, String period, Realm realm) async {
  List<String> schedule = ["course", "teacher"];
  final currentUser = Provider.of<AppServices>(context).currentUser;
  //final id = currentUser?.id;
  var empty = await isDBempty(realm, 'owner_id == "${currentUser?.id}"');
  if (empty) {
  }
  var userSearch = await newDBquery(realm, 'owner_id == "${currentUser?.id}"');

  switch (period) {
    case "1":
      {
        //OLD PARAMS 'owner_id == "${currentUser?.id}"'
        schedule[0] = userSearch.last.periodOneCourse;
        schedule[1] = userSearch.last.periodOneTeacher;
      }
      break;
    case "2":
      {
        schedule[0] = userSearch.last.periodTwoCourse;
        schedule[1] = userSearch.last.periodTwoTeacher;
      }
      break;
    case "3":
      {
        schedule[0] = userSearch.last.periodThreeCourse;
        schedule[1] = userSearch.last.periodThreeTeacher;
      }
      break;
    case "4":
      {
        schedule[0] = userSearch.last.periodFourCourse;
        schedule[1] = userSearch.last.periodFourTeacher;
      }
      break;
    case "5":
      {
        schedule[0] = userSearch.last.periodFiveCourse;
        schedule[1] = userSearch.last.periodFiveTeacher;
      }
      break;
    case "6":
      {
        schedule[0] = userSearch.last.periodSixCourse;
        schedule[1] = userSearch.last.periodSixTeacher;
      }
      break;
  }
  return schedule;
}

// String periodOneCourse(String? id) =>
//     realm.query<user_info>('owner_id == "' + id! + '"').first.periodOneCourse;

void setEmail(String email) {
  _email = email;
}

void setClass(String periodNumber, String course) {
  switch (periodNumber) {
    case "1":
      {
        _periodOneCourse = course;
      }
      break;

    case "2":
      {
        _periodTwoCourse = course;
      }
      break;

    case "3":
      {
        _periodThreeCourse = course;
      }
      break;

    case "4":
      {
        _periodFourCourse = course;
      }
      break;

    case "5":
      {
        _periodFiveCourse = course;
      }
      break;

    case "6":
      {
        _periodSixCourse = course;
      }
      break;
  }
}

void setTeacher(String periodNumber, String teacher) {
  switch (periodNumber) {
    case "1":
      {
        _periodOneTeacher = teacher;
      }
      break;

    case "2":
      {
        _periodTwoTeacher = teacher;
      }
      break;

    case "3":
      {
        _periodThreeTeacher = teacher;
      }
      break;

    case "4":
      {
        _periodFourTeacher = teacher;
      }
      break;

    case "5":
      {
        _periodFiveTeacher = teacher;
      }
      break;

    case "6":
      {
        _periodSixTeacher = teacher;
      }
      break;
  }
}

//     final currentUser = Provider.of<AppServices>(context).currentUser;
//     final realm = Provider.of<Realm?>(context);
//     if (realm == null) {
//       return Container();
//     }
//     final stream =
//         realm.query<Todo>('owner_id == "${currentUser?.id}"').changes;

String get name => _name;

String get email => _email;

String get periodOneCourse => _periodOneCourse;

String get periodTwoCourse => _periodTwoCourse;

String get periodThreeCourse => _periodThreeCourse;

String get periodFourCourse => _periodFourCourse;

String get periodFiveCourse => _periodFiveCourse;

String get periodSixCourse => _periodSixCourse;

String get periodOneTeacher => _periodOneTeacher;

String get periodTwoTeacher => _periodTwoTeacher;

String get periodThreeTeacher => _periodThreeTeacher;

String get periodFourTeacher => _periodFourTeacher;

String get periodFiveTeacher => _periodFiveTeacher;

String get periodSixTeacher => _periodSixTeacher;
