import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myvpn/colors.dart';
import 'package:myvpn/screens/drawer.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<String> protocols = [
    'English',
    'Chinese',
  ];
  String? _selectedProtocol = "English";
  bool tlsValue = true;
  bool xtlsValue = true;
  bool showTraffic = true;
  bool insecureTLS = true;
  bool autoUpdateServerList = false;
  bool autoReconnect = true;

  List<String> proxies = ['All Application'];
  String? _selectedProxy = "All Application";

  List<String> routingRules1 = ['Global', 'Bypass LAN and China IP'];
  String? _selectedRoutingRule1 = "Global";

  List<String> routingRules2 = ['Global', 'Bypass LAN and China IP'];
  String? _selectedRoutingRule2 = "Bypass LAN and China IP";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawers(),
      appBar: AppBar(
        backgroundColor: color4,
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
              'Settings',
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
                  'GENERAL',
                  style: h4_black,
                ),
              ),
            ),
            Divider(
              height: 3,
              thickness: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(children: [
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Language',
                            style: h4_black,
                          ),
                          Expanded(child: Text('')),
                          DropdownButton(
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
                        ],
                      ),
                      // Text(
                      //   'The server list would refresh/change when protocol changed.',
                      //   style: h5_grey,
                      // )
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                //   child: Divider(
                //     height: 2,
                //     thickness: 2,
                //   ),
                // ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'App Proxy',
                            style: h4_black,
                          ),
                          Expanded(child: Text('')),
                          DropdownButton(
                            dropdownColor: color4,
                            iconEnabledColor: color1,
                            underline: Container(),
                            value: _selectedProxy,
                            items: proxies
                                .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e,
                                      style: pinkbold,
                                    )))
                                .toList(),
                            onChanged: (String? val) {
                              setState(() {
                                _selectedProxy = val;
                              });
                            },
                          ),
                        ],
                      ),
                      // Text(
                      //   'The server list would refresh/change when protocol changed.',
                      //   style: h5_grey,
                      // )
                    ],
                  ),
                ),
                //toreplacedivider
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Routing Rules',
                            style: h4_black,
                          ),
                          Expanded(child: Text('')),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              DropdownButton(
                                dropdownColor: color4,
                                iconEnabledColor: color1,
                                underline: Container(),
                                value: _selectedRoutingRule1,
                                selectedItemBuilder: (BuildContext context) {
                                  return routingRules1
                                      .map<Widget>((String item) {
                                    return Container(
                                        alignment: Alignment.centerRight,
                                        width: 180,
                                        child: Text(item,
                                            style: pinkbold,
                                            textAlign: TextAlign.end));
                                  }).toList();
                                },
                                items: routingRules1
                                    .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              e,
                                              style: pinkbold,
                                            ),
                                          ],
                                        )))
                                    .toList(),
                                onChanged: (String? val) {
                                  setState(() {
                                    _selectedRoutingRule1 = val;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //toreplacedivider
                ListTile(
                    contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    leading: Text(
                      'Show Traffic',
                      style: h4_black,
                    ),
                    trailing: Transform.scale(
                      scale: 1.5,
                      child: Switch(
                          activeColor: color4,
                          activeTrackColor: color6,
                          value: showTraffic,
                          onChanged: (value) {
                            setState(() {
                              showTraffic = !showTraffic;
                            });
                          }),
                    )),
                //toreplacedivider
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: color7.withOpacity(0.2),
              child: ListTile(
                leading: Text(
                  'VMESS/TROJAN/VLESS',
                  style: h4_black,
                ),
              ),
            ),
            Divider(
              height: 2,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(children: [
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Routing Rules',
                            style: h4_black,
                          ),
                          Expanded(child: Text('')),
                          DropdownButton(
                            dropdownColor: color4,
                            iconEnabledColor: color1,
                            underline: Container(),
                            value: _selectedRoutingRule2,
                            selectedItemBuilder: (BuildContext context) {
                              return routingRules2.map<Widget>((String item) {
                                return Container(
                                    alignment: Alignment.centerRight,
                                    width: 180,
                                    child: Text(item,
                                        style: pinkbold,
                                        textAlign: TextAlign.end));
                              }).toList();
                            },
                            items: routingRules2
                                .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          e,
                                          style: pinkbold,
                                        ),
                                      ],
                                    )))
                                .toList(),
                            onChanged: (String? val) {
                              setState(() {
                                _selectedRoutingRule2 = val;
                              });
                            },
                          ),
                        ],
                      ),
                      // Text(
                      //   'Split traffic when connect with VMESS/Trojan/VLESS.',
                      //   style: h5_grey,
                      // )
                    ],
                  ),
                ),
                //toreplacedivider
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: color7.withOpacity(0.2),
              child: ListTile(
                leading: Text(
                  'AUTOMATIC',
                  style: h4_black,
                ),
              ),
            ),
            Divider(
              height: 2,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(children: [
                ListTile(
                    contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    leading: Text(
                      'Auto Update Server List',
                      style: h4_black,
                    ),
                    trailing: Transform.scale(
                      scale: 1.5,
                      child: Switch(
                          activeColor: color4,
                          activeTrackColor: color6,
                          value: autoUpdateServerList,
                          onChanged: (value) {
                            setState(() {
                              autoUpdateServerList = !autoUpdateServerList;
                            });
                          }),
                    )),
                //toreplacedivider
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Auto Reconnect',
                            style: h4_black,
                          ),
                          Expanded(child: Text('')),
                          Transform.scale(
                            scale: 1.5,
                            child: Switch(
                                activeColor: color4,
                                activeTrackColor: color6,
                                value: autoReconnect,
                                onChanged: (value) {
                                  setState(() {
                                    autoReconnect = !autoReconnect;
                                  });
                                }),
                          ),
                        ],
                      ),
                      // Text(
                      //   'Reconnect after network outage/failover.',
                      //   style: h5_grey,
                      // )
                    ],
                  ),
                ),
                //toreplacedivider
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: color7.withOpacity(0.2),
              child: ListTile(
                leading: Text(
                  'ABOUT',
                  style: h4_black,
                ),
              ),
            ),
            Divider(
              height: 2,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                  child: Text(
                'Version: 20210517 \nWebsite: https://www.vtrspeed.com \nTelegram: https://t.me/vtrspeed \nEmail: support@vpnteam.net',
                style: h4_black,
              )),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
