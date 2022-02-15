import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myvpn/colors.dart';
import 'package:myvpn/includes/public_functions.dart';
import 'package:myvpn/screens/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Locations extends StatefulWidget {
  const Locations({Key? key}) : super(key: key);

  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  String button = "connect";
  int serverTimeOut = 0;
  String? _selectedProtocol;

  String? _locationGroup = "usa1";
  String? _locationus1 = 'usa1';
  String? _locationus2 = 'usa2';
  String? _locationus3 = 'france';
  String? _locationus4 = 'taiwan1';
  String? _locationus5 = 'taiwan2';
  String? _locationus6 = 'hk1';
  String? _locationus7 = 'hk2';
  String? _locationus8 = 'australia';
  String? _locationus9 = 'singapore1';
  String? _locationus10 = 'singapore2';
  String? _locationus11 = 'japan1';

  List<String> protocols = [
    'AnyConnect',
    'VLESS',
    'WebVPN',
    'Cisco IPSec',
    'L2TP',
    'VMESS',
    'Trojan'
  ];

  showPing() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Container(child: Text('Ping test...')),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                spinkit,
              ],
            ),
          );
        });
  }

  LoginData logindata = LoginData();
  String? version;
  String? dns;
  String? updatesn;
  String? group;
  String? date;
  String? type;
  String? clienttype;
  String? ssh;
  String? ss5;
  String? uuid;
  Future reload() async {
    setState(() {
      version = logindata.version;
      dns = logindata.dns;
      updatesn = logindata.updatesn;
      group = logindata.group;
      date = logindata.date;
      type = logindata.date;
      clienttype = logindata.clienttype;
      ssh = logindata.ssh;
      ss5 = logindata.ss5;
      uuid = logindata.uuid;
    });
  }

  String? serverListExists;
  checkServerList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      serverListExists = prefs.getString('serverList');
      if (serverListExists == null) {
        getServerList();
      } else {
        originalServerList = jsonDecode(serverListExists!);
        serverList = originalServerList;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    logindata.storeLogindata().then((value) {
      reload().then((value) {
        checkServerList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0x00000000),
        title: Text('Location'),
        actions: [
          IconButton(
            onPressed: () {
              //Navigator.pushNamed(context, '/edit_server');
              showPing();
              Future.delayed(Duration(seconds: 2))
                  .then((value) => Navigator.pop(context));
            },
            icon: Icon(Icons.donut_large_sharp),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add_server');
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/girl.jpg'),
          fit: BoxFit.cover,
        )),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
          child: Container(
            color: Colors.transparent.withOpacity(0.0),
            child: RefreshIndicator(
              onRefresh: () async {
                await getServerList();
              },
              child: ListView(
                children: [
                  originalServerList.length == 0
                      ? Container()
                      : Container(
                          color: color4,
                          child: ListTile(
                            leading: Text(
                              'Protocol Type',
                              style: h4_black,
                            ),
                            trailing: DropdownButton(
                              hint: DropdownMenuItem(
                                child: Text('Select Protocol'),
                              ),
                              dropdownColor: color4,
                              iconEnabledColor: color1,
                              underline: Container(),
                              value: _selectedProtocol,
                              items: protocols
                                  .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e,
                                        style: pinkbold,
                                      )))
                                  .toList(),
                              onChanged: (String? val) {
                                setState(() {
                                  _selectedProtocol = val;
                                  //serverList = originalServerList;
                                  serverList =
                                      originalServerList.where((element) {
                                    if (val == "AnyConnect") {
                                      return element['note']
                                          .contains('AnyConnect');
                                    } else if (val == "VLESS") {
                                      return element['note'].contains('VLESS');
                                    } else if (val == "WebVPN") {
                                      return element['note'].contains('WebVPN');
                                    } else if (val == "Cisco IPSec") {
                                      return element['note'].contains('IKEv1');
                                    } else if (val == "L2TP") {
                                      return element['note'].contains('L2TP');
                                    } else if (val == "VMESS") {
                                      return element['note'].contains('V2Ray');
                                    } else if (val == "Trojan") {
                                      return element['note'].contains('Trojan');
                                    } else {
                                      return element['note'].contains(val);
                                    }
                                  }).toList();
                                });
                              },
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  originalServerList.length == 0
                      ? Center(
                          child: Container(
                            child: spinkit,
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: serverList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  color: color4,
                                  child: RadioListTile<String>(
                                    value: serverList[index]['address'],
                                    groupValue: _locationGroup,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _locationGroup = value;
                                      });
                                    },
                                    title: Row(
                                      children: [
                                        Expanded(
                                            flex: 3,
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Image.asset(
                                                    'assets/images/flags/${serverList[index]['geo'].toLowerCase()}.png'))),
                                        Text(
                                          'Timeout',
                                          style: redcount,
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, '/edit_server');
                                            },
                                            icon: Icon(
                                              Icons.info_outline_rounded,
                                              color: color6,
                                            ))
                                      ],
                                    ),
                                    subtitle: Text(serverList[index]['name']),
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                              ],
                            );
                          }),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? serverData;
  List<dynamic> serverList = [];
  List<dynamic> originalServerList = [];
  Future getServerList() async {
    http.Response response;
    var url;
    if (Platform.isIOS) {
      url = "http://api-ios.badapp.xyz/server.php?g=$clienttype&lang=en&v=ios";
    } else {
      url =
          "http://api-ios.badapp.xyz/server.php?g=$clienttype&lang=en&v=android";
    }
    response = await http.post(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        serverData = response.body;
        originalServerList = jsonDecode(response.body);
        serverList = originalServerList;
        storeServerList();
      });
    } else {
      Fluttertoast.showToast(
          msg: "There was a problem getting the server list. Please try again",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: color9,
          textColor: color4,
          timeInSecForIosWeb: 3,
          fontSize: 16.0);
    }
  }

  Future storeServerList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('serverList', serverData!);
  }
}
