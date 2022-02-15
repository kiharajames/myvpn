import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myvpn/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/girl.jpg'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
            child: Container(
              color: Colors.transparent.withOpacity(0.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Welcome to VTRSpeed',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: color4, fontSize: 50.0)),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                          'The best way to navigate your world and discover new interests. Let\'s get started!',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: color4, fontSize: 15.0)),
                      SizedBox(height: MediaQuery.of(context).size.width / 3),
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.width / 7,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        textColor: color4,
                        color: color2,
                        child: Text('SIGN UP NOW'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/subscription',
                              arguments: 1);
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MaterialButton(
                          minWidth: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.width / 7,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          textColor: color4,
                          color: color1,
                          child: Text('LOGIN'),
                          onPressed: () {
                            checUserLogin();
                            //Navigator.pushNamed(context, '/login');
                          }),
                      SizedBox(
                        height: 15,
                      ),
                      MaterialButton(
                          minWidth: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.width / 7,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          textColor: color4,
                          color: color3,
                          child: Text('Manual Setup'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/add_server');
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? username;
  checUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
    });
    if (username == null) {
      Navigator.pushNamed(context, '/login');
    } else {
      Navigator.pushNamed(context, '/connect');
    }
  }
}
