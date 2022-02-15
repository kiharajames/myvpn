import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myvpn/colors.dart';
import 'package:myvpn/screens/drawer.dart';

class Connect extends StatefulWidget {
  const Connect({Key? key}) : super(key: key);

  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  bool vless = true;
  void changeSwitch(value) {
    setState(() {
      vless = value;
    });
  }

  String button = "connect";
  int serverTimeOut = 0;
  int next = 0;

  void startTimeOut() {
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        serverTimeOut = 1;
        button = "connect";
      });
    }).then((value) => next++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        drawer: Drawers(),
        appBar: button == "connecting" || next > 1
            ? AppBar(
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
              )
            : AppBar(
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
        body: next <= 1
            ? Container(
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: color3),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/images/connect-check.png',
                                    ),
                                  )),
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
                                height: 40,
                              ),
                              button == "connecting"
                                  ? Container(
                                      height: 100,
                                      child: Center(child: spinkit),
                                    )
                                  : serverTimeOut == 1
                                      ? Container()
                                      : Container(
                                          height: 100,
                                          child: Center(
                                            child: Text(''),
                                          ),
                                        ),
                              serverTimeOut == 1
                                  ? Container(
                                      height: 90.0,
                                      margin:
                                          EdgeInsets.fromLTRB(20, 0, 20, 10),
                                      decoration: BoxDecoration(
                                          color: color7.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                          child: Text(
                                        'Server\nTimeout',
                                        textAlign: TextAlign.center,
                                        style: h4_black,
                                      )),
                                    )
                                  : Container(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  button == "connect"
                                      ? MaterialButton(
                                          height: 50,
                                          minWidth: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25))),
                                          textColor: color4,
                                          color: color3,
                                          child: Text(
                                            'Connect',
                                            style: buttonTextStyle,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              button = "connecting";
                                              serverTimeOut = 0;
                                            });
                                            startTimeOut();
                                          })
                                      : MaterialButton(
                                          height: 50,
                                          minWidth: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25))),
                                          textColor: color4,
                                          color: color8,
                                          child: Text(
                                            'Connecting',
                                            style: buttonTextStyle,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              button = "connect";
                                            });
                                          }),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container(
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
                                        child: Image.asset(
                                            'assets/images/hero.png'),
                                      )),
                                  Positioned(
                                      top: 45.0,
                                      right: 15.0,
                                      child: Text('145 kbps'))
                                ],
                              ),
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/locations');
                                  },
                                  child: Text(
                                    'USA - LAX',
                                    style: h2,
                                  ),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                      height: 50,
                                      minWidth:
                                          MediaQuery.of(context).size.width /
                                              1.2,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25))),
                                      textColor: color9,
                                      color: color9,
                                      child: Text(
                                        'Disconnect',
                                        style: buttonTextStyle,
                                      ),
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(
                                            context, '/connect');
                                      })
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
        bottomNavigationBar: next > 1
            ? Container(
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/stats1.png'),
                      fit: BoxFit.cover),
                ),
                child: Text(''),
              )
            : Container(
                child: Text(''),
              ));
  }
}
