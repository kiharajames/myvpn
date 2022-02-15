import 'package:flutter/material.dart';
import 'package:myvpn/route_generator.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prf = await SharedPreferences.getInstance();
  checUserLogin(prf);
}

//check whether the user was logged in before and take them directly to the
//connection page rather then the homepage

Future checUserLogin(dynamic prefs) async {
  dynamic username = prefs.getString('username');
  if (username == null) {
    runApp(MyApp());
  } else {
    runApp(MyApp2());
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VPN App',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class MyApp2 extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VPN App',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/connect",
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
