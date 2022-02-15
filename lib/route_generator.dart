import 'package:flutter/material.dart';
import 'package:myvpn/screens/add_server.dart';
import 'package:myvpn/screens/connect.dart';
import 'package:myvpn/screens/connected.dart';
import 'package:myvpn/screens/edit_server.dart';
import 'package:myvpn/screens/locations.dart';
import 'package:myvpn/screens/login.dart';
import 'package:myvpn/screens/settings.dart';
import 'package:myvpn/screens/subscription.dart';
import 'package:myvpn/screens/welcome.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Welcome());
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/connect':
        return MaterialPageRoute(builder: (_) => Connect());
      case '/connected':
        return MaterialPageRoute(builder: (_) => Connected());
      case '/locations':
        return MaterialPageRoute(builder: (_) => Locations());
      case '/edit_server':
        return MaterialPageRoute(builder: (_) => EditServer());
      case '/add_server':
        return MaterialPageRoute(builder: (_) => AddServer());
      case '/settings':
        return MaterialPageRoute(builder: (_) => Settings());
      case '/subscription':
        var args = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => Subscription(
                  notLogged: args,
                ));
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Container(
            child: Text('Sorry, an error has occured'),
          ),
        ),
      );
    });
  }
}
