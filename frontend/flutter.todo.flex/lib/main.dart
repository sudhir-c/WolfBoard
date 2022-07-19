import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter_todo/realm/init_realm.dart';
import 'package:flutter_todo/scheduleviews/scheduleview2.dart';
import 'package:flutter_todo/scheduleviews/scheduleview3.dart';
import 'package:flutter_todo/scheduleviews/scheduleview4.dart';
import 'package:flutter_todo/scheduleviews/scheduleview5.dart';
import 'package:flutter_todo/scheduleviews/scheduleview6.dart';
import 'package:flutter_todo/screens/bug.dart';
import 'package:flutter_todo/screens/default.dart';
import 'package:flutter_todo/scheduleviews/scheduleview.dart';
import 'package:flutter_todo/screens/redirect.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'realm/app_services.dart';
import './screens/homepage.dart';
import './screens/log_in.dart';
//import 'package:realm_dart/realm.dart';

void main() async {
  // get app id from config
  WidgetsFlutterBinding.ensureInitialized();
  final realmConfig =
      json.decode(await rootBundle.loadString('assets/config/realm.json'));
  String appId = realmConfig['appId'];
  Uri baseUrl = Uri.parse(realmConfig['baseUrl']);

  return runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AppServices>(
        create: (_) => AppServices(appId, baseUrl)),
    ProxyProvider<AppServices, Realm?>(
      update: (context, app, previousRealm) {
        if (app.currentUser != null) {
          previousRealm?.close();
          return initRealm(app.currentUser!);
        }
        return null;
      },
      dispose: (_, realm) => realm?.close(),
    )
  ], child: const App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser =
        Provider.of<AppServices>(context, listen: false).currentUser;
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        title: 'Schedule App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        //initialRoute: '/period1',
        initialRoute: currentUser != null ? '/' : '/login',
        routes: {
          '/': (context) => const HomePage(),
          '/redirect': (context) => Redirect(),
          '/login': (context) => LogIn(),
          '/bug': (context) => Bug(),
          '/default': (context) => const Default(),
          '/period1': (context) => ScheduleView(),
          '/period2': (context) => ScheduleView2(),
          '/period3': (context) => ScheduleView3(),
          '/period4': (context) => ScheduleView4(),
          '/period5': (context) => ScheduleView5(),
          '/period6': (context) => ScheduleView6()
        },
      ),
    );
  }
}
