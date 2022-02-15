import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myvpn/colors.dart';
import 'package:myvpn/screens/drawer.dart';

class EditServer extends StatefulWidget {
  const EditServer({Key? key}) : super(key: key);

  @override
  _EditServerState createState() => _EditServerState();
}

class _EditServerState extends State<EditServer> {
  List<String> protocols = [
    'AnyConnect',
    'VLESS',
    'WebVPN',
    'Cisco IPSec',
    'L2TP',
    'VMESS',
    'Trojan'
  ];
  String? _selectedProtocol = "AnyConnect";
  bool tlsValue = true;
  bool xtlsValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Drawers(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0x00000000),
        leading: Builder(builder: (context) {
          return IconButton(
            color: color1,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.menu),
          );
        }),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Edit Server',
              textAlign: TextAlign.center,
              style: h3,
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.cancel_outlined,
                color: color1,
              )),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: color3,
                    content: Text(
                      'Updated Successfully',
                      style: h4_white,
                    )));
              },
              icon: Icon(
                Icons.check,
                color: color1,
              ))
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              color: color7.withOpacity(0.2),
              child: ListTile(
                leading: Text(
                  'Protocol Type',
                  style: h4_black,
                ),
                trailing: DropdownButton(
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
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: color7.withOpacity(0.2),
              child: Column(
                children: [
                  ListTile(
                      leading: Text(
                        'Remark',
                        style: h4_black,
                      ),
                      trailing: Text(
                        'Server 1',
                        style: h4_grey,
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Divider(
                      color: color7,
                      height: 2,
                    ),
                  ),
                  ListTile(
                      leading: Text(
                        'Server Address',
                        style: h4_black,
                      ),
                      trailing: Text(
                        'vpn1.website.com',
                        style: h4_grey,
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Divider(
                      color: color7,
                      height: 2,
                    ),
                  ),
                  ListTile(
                      leading: Text(
                        'Port',
                        style: h4_black,
                      ),
                      trailing: Text(
                        '12345',
                        style: h4_grey,
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Divider(
                      color: color7,
                      height: 2,
                    ),
                  ),
                  ListTile(
                      leading: Text(
                        'UUID',
                        style: h4_black,
                      ),
                      trailing: Text(
                        '2ebd36-f47fg-f4fh4y4',
                        style: h4_grey,
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Divider(
                      color: color7,
                      height: 2,
                    ),
                  ),
                  ListTile(
                      leading: Text(
                        'TLS',
                        style: h4_black,
                      ),
                      trailing: Transform.scale(
                        scale: 1.5,
                        child: Switch(
                            activeColor: color4,
                            activeTrackColor: color6,
                            value: tlsValue,
                            onChanged: (value) {
                              setState(() {
                                tlsValue = !tlsValue;
                              });
                            }),
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Divider(
                      color: color7,
                      height: 2,
                    ),
                  ),
                  ListTile(
                      leading: Text(
                        'XTLS Direct',
                        style: h4_black,
                      ),
                      trailing: Transform.scale(
                        scale: 1.5,
                        child: Switch(
                            activeColor: color4,
                            activeTrackColor: color6,
                            value: xtlsValue,
                            onChanged: (value) {
                              setState(() {
                                xtlsValue = !xtlsValue;
                              });
                            }),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: MaterialButton(
                onPressed: () {},
                color: color9,
                height: 50.0,
                minWidth: MediaQuery.of(context).size.width / 1.4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  'Delete',
                  style: h4_white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
