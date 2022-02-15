import 'package:flutter/material.dart';
import 'package:myvpn/includes/public_functions.dart';
import 'package:myvpn/screens/connect.dart';
import '../colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Drawers extends StatefulWidget {
  const Drawers({Key? key}) : super(key: key);

  @override
  _DrawersState createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  DateTime now = new DateTime.now();
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
  String? username;
  reload() {
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
      username = logindata.username;
    });
  }

  @override
  void initState() {
    super.initState();
    logindata.storeLogindata().then((value) => reload());
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: color4,
        child: Column(
          children: [
            Column(children: [
              DrawerHeader(
                  child: Column(
                children: [
                  CircleAvatar(
                    minRadius: 40,
                    maxRadius: 40,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  version == null
                      ? Text('')
                      : Text(
                          '${username!} | ${logindata.group!}',
                          style: h4_black,
                        ),
                  //       Text(
                  //   'User-Name',
                  //   style: h4_black,
                  // ),
                  version == null
                      ? Text('')
                      : Text(
                          logindata.date!,
                          style: pinkbold,
                        ),
                ],
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: ListView(children: [
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/connect');
                    },
                    leading: Icon(Icons.account_circle_sharp),
                    title: Text(
                      'Home',
                      style: h4_black,
                    ),
                  ),
                  ListTile(
                    leading: FaIcon(FontAwesomeIcons.globeAmericas),
                    title: Text(
                      'Services',
                      style: h4_black,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/subscription');
                    },
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                    leading: Icon(Icons.settings),
                    title: Text(
                      'Settings',
                      style: h4_black,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text(
                      'Contact',
                      style: h4_black,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text(
                      'v20210601',
                      style: h4_black,
                    ),
                  ),
                ]),
              )
            ]),
            Expanded(child: Text('')),
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Log Out',
                  style: h4_black,
                ),
                onTap: () {
                  clearUserData().then((value) =>
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', (Route<dynamic> route) => false));
                },
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/subscription');
                },
                child: Container(
                  height: 70,
                  color: color2,
                  child: Center(
                    child: Text(
                      'Mix Service',
                      style: h4_white,
                    ),
                  ),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
