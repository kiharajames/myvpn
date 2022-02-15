import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myvpn/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool vless = false;
  void changeSwitch(value) {
    setState(() {
      vless = value;
    });
  }

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  int loginStatus = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0x00000000),
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
                      Row(
                        children: [
                          Text('Login',
                              textAlign: TextAlign.start,
                              style: TextStyle(color: color4, fontSize: 40.0)),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width / 5),
                      Row(
                        children: [
                          Text('UserName or UUID',
                              style: TextStyle(color: color4, fontSize: 20.0)),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: user,
                        style: h4_white,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: color4)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: color4)),
                            labelText: 'privatevpn.username/uuid',
                            labelStyle: h4_white),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      vless == false
                          ? TextField(
                              controller: pass,
                              style: h4_white,
                              obscureText: true,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: color4)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: color4)),
                                  labelText: '●●●●●●●●',
                                  labelStyle: h4_white),
                            )
                          : Container(
                              height: 48,
                            ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: Switch(
                                activeColor: color4,
                                activeTrackColor: color6,
                                inactiveThumbColor: color4,
                                inactiveTrackColor: color7,
                                value: vless,
                                onChanged: (value) {
                                  changeSwitch(value);
                                }),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            'V2RAY/Trojan/VLESS Only',
                            style: h4_white,
                          ))
                        ],
                      ),
                      Row(
                        children: [
                          MaterialButton(
                              //minWidth: MediaQuery.of(context).size.width / 1.2,
                              height: MediaQuery.of(context).size.width / 7,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              textColor: color4,
                              color: color2,
                              child: Text(
                                'LOGIN',
                                style: buttonTextStyle,
                              ),
                              onPressed: () {
                                setState(() {
                                  loginStatus = 1;
                                });
                                authenticate();
                                //Navigator.pushNamed(context, '/connect');
                              }),
                          loginStatus == 1
                              ? Container(
                                  height: 100,
                                  child: Center(child: spinkit),
                                )
                              : Container()
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: color1.withOpacity(0.2),
        child: SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don’t have an account?',
                    style: h4_white, textAlign: TextAlign.center),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/subscription', arguments: 1);
                  },
                  child: Text('Order now',
                      style: TextStyle(color: color6, fontSize: 17),
                      textAlign: TextAlign.center),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  var loginResponseData = new Map();
  Future authenticate() async {
    String password = pass.text;
    convert.Codec<String, String> stringToBase64 =
        convert.utf8.fuse(convert.base64);
    String encoded = stringToBase64.encode(password);

    http.Response response;
    var url;
    if (vless == true) {
      url = Uri.parse(
          "http://api-ios.badapp.xyz/login.php?user=${user.text}&v2=v2");
    } else {
      url = Uri.parse(
          "http://api-ios.badapp.xyz/login.php?user=${user.text}&pass=$encoded");
    }

    response = await http.post(url, body: {});
    if (response.statusCode == 200) {
      setState(() {
        loginResponseData = convert.jsonDecode(response.body);
        loginStatus = 0;
      });
      if (loginResponseData['result'] == 'OK') {
        //add the response details as shared preferences
        storeLogindata()
            .then((value) => Navigator.pushNamed(context, '/connect'));
      } else {
        Fluttertoast.showToast(
            msg: "Please enter correct username and password",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: color9,
            textColor: color4,
            fontSize: 16.0);
      }
    } else {
      setState(() {
        loginStatus = 0;
      });
      Fluttertoast.showToast(
          msg: "There was a problem making a connection. Please try again.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: color9,
          textColor: color4,
          fontSize: 16.0);
    }
  }

  Future storeLogindata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('updatesn', loginResponseData['updatesn']);
    prefs.setString('version', loginResponseData['version']);
    prefs.setString('dns', loginResponseData['dns']);
    prefs.setString('group', loginResponseData['group']);
    prefs.setString('date', loginResponseData['date']);
    prefs.setString('type', loginResponseData['type']);
    prefs.setString('clienttype', loginResponseData['clienttype']);
    prefs.setString('ssh', loginResponseData['ssh']);
    prefs.setString('ss5', loginResponseData['ss5']);
    prefs.setString('uuid', loginResponseData['uuid']);
    prefs.setString('username', user.text);
  }
}
