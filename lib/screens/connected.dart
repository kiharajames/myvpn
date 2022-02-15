import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myvpn/colors.dart';
import 'package:myvpn/screens/drawer.dart';

class Connected extends StatefulWidget {
  const Connected({Key? key}) : super(key: key);

  @override
  _ConnectedState createState() => _ConnectedState();
}

class _ConnectedState extends State<Connected> {
  bool vless = true;
  void changeSwitch(value) {
    setState(() {
      vless = value;
    });
  }

  String button = "connect";
  int serverTimeOut = 0;

  void startTimeOut() {
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        serverTimeOut = 1;
        button = "connect";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        drawer: Drawers(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0x00000000),
          leading: Builder(
            builder: (BuildContext context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu_open),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/locations');
              },
              icon: Icon(Icons.menu),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/girl.jpg'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
              child: Container(
                color: Colors.transparent.withOpacity(0.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                                height: 250,
                                width: 250,
                                child: Center(
                                  child: Image.asset('assets/images/hero.png'),
                                )),
                            Positioned(
                                top: 45.0, right: 15.0, child: Text('145 kbps'))
                          ],
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'USA - LAX',
                            style: h2,
                          ),
                        ),
                        Text(
                          'AnyConnect',
                          style: h4_white_bold,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '00:00:10',
                          style: h4_white_bold,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            MaterialButton(
                                height: 50,
                                minWidth:
                                    MediaQuery.of(context).size.width / 1.2,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                textColor: color9,
                                color: color9,
                                child: Text(
                                  'Discount',
                                  style: buttonTextStyle,
                                ),
                                onPressed: () {})
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/stats1.png'),
                fit: BoxFit.cover),
          ),
          child: Text(''),
        ));
  }
}
