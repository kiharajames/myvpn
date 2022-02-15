import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myvpn/colors.dart';
import 'package:myvpn/screens/drawer.dart';

class AddServer extends StatefulWidget {
  const AddServer({Key? key}) : super(key: key);

  @override
  _AddServerState createState() => _AddServerState();
}

class _AddServerState extends State<AddServer> {
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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
              'Add Server',
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
                      'Added Successfully',
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
              child: _selectedProtocol == "VLESS"
                  ? Column(
                      children: [
                        TextField(
                          style: h4_black,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 10, 10, 10),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: color4)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: color4)),
                              hintText: 'Required',
                              labelText: 'Remark',
                              labelStyle: h4_black,
                              hintStyle: h4_black),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Divider(
                            color: color7,
                            height: 2,
                          ),
                        ),
                        TextField(
                          style: h4_black,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 10, 10, 10),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: color4)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: color4)),
                              hintText: 'Required',
                              labelText: 'Server Address',
                              labelStyle: h4_black,
                              hintStyle: h4_black),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Divider(
                            color: color7,
                            height: 2,
                          ),
                        ),
                        // ListTile(
                        //     leading: Text(
                        //       'Port',
                        //       style: h4_black,
                        //     ),
                        //     trailing: Text(
                        //       'Required',
                        //       style: h4_grey,
                        //     )),
                        TextField(
                          style: h4_black,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 10, 10, 10),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: color4)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: color4)),
                              hintText: 'Required',
                              labelText: 'Port',
                              labelStyle: h4_black,
                              hintStyle: h4_black),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Divider(
                            color: color7,
                            height: 2,
                          ),
                        ),
                        // ListTile(
                        //     leading: Text(
                        //       'UUID',
                        //       style: h4_black,
                        //     ),
                        //     trailing: Text(
                        //       'Required',
                        //       style: h4_grey,
                        //     )),
                        TextField(
                          style: h4_black,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 10, 10, 10),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: color4)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: color4)),
                              hintText: 'Required',
                              labelText: 'UUID',
                              labelStyle: h4_black,
                              hintStyle: h4_black),
                        ),
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
                    )
                  : _selectedProtocol == "AnyConnect" ||
                          _selectedProtocol == "WebVPN"
                      ? Column(
                          children: [
                            TextField(
                              style: h4_black,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: color4)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: color4)),
                                  hintText: 'Required',
                                  labelText: 'Remark',
                                  labelStyle: h4_black,
                                  hintStyle: h4_black),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Divider(
                                color: color7,
                                height: 2,
                              ),
                            ),
                            TextField(
                              style: h4_black,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: color4)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: color4)),
                                  hintText: 'Required',
                                  labelText: 'Server Address',
                                  labelStyle: h4_black,
                                  hintStyle: h4_black),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Divider(
                                color: color7,
                                height: 2,
                              ),
                            ),
                            TextField(
                              style: h4_black,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: color4)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: color4)),
                                  hintText: 'Required',
                                  labelText: 'Port',
                                  labelStyle: h4_black,
                                  hintStyle: h4_black),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Divider(
                                color: color7,
                                height: 2,
                              ),
                            ),
                            TextField(
                              style: h4_black,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: color4)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: color4)),
                                  hintText: 'Required',
                                  labelText: 'UserName',
                                  labelStyle: h4_black,
                                  hintStyle: h4_black),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Divider(
                                color: color7,
                                height: 2,
                              ),
                            ),
                            TextField(
                              style: h4_black,
                              obscureText: true,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: color4)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: color4)),
                                  hintText: 'Required',
                                  labelText: 'Password',
                                  labelStyle: h4_black,
                                  hintStyle: h4_black),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Divider(
                                color: color7,
                                height: 2,
                              ),
                            ),
                          ],
                        )
                      : _selectedProtocol == "Cisco IPSec"
                          ? Column(
                              children: [
                                TextField(
                                  style: h4_black,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: color4)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: color4)),
                                      hintText: 'Required',
                                      labelText: 'Remark',
                                      labelStyle: h4_black,
                                      hintStyle: h4_black),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Divider(
                                    color: color7,
                                    height: 2,
                                  ),
                                ),
                                TextField(
                                  style: h4_black,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: color4)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: color4)),
                                      hintText: 'Required',
                                      labelText: 'Server Address',
                                      labelStyle: h4_black,
                                      hintStyle: h4_black),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Divider(
                                    color: color7,
                                    height: 2,
                                  ),
                                ),
                                TextField(
                                  style: h4_black,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: color4)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: color4)),
                                      hintText: 'Optional',
                                      labelText: 'Group Name',
                                      labelStyle: h4_black,
                                      hintStyle: h4_black),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Divider(
                                    color: color7,
                                    height: 2,
                                  ),
                                ),
                                TextField(
                                  style: h4_black,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: color4)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: color4)),
                                      hintText: 'Required',
                                      labelText: 'IPSec PSK',
                                      labelStyle: h4_black,
                                      hintStyle: h4_black),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Divider(
                                    color: color7,
                                    height: 2,
                                  ),
                                ),
                                TextField(
                                  style: h4_black,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: color4)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: color4)),
                                      hintText: 'Required',
                                      labelText: 'Username',
                                      labelStyle: h4_black,
                                      hintStyle: h4_black),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Divider(
                                    color: color7,
                                    height: 2,
                                  ),
                                ),
                                TextField(
                                  style: h4_black,
                                  obscureText: true,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: color4)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: color4)),
                                      hintText: 'Required',
                                      labelText: 'Password',
                                      labelStyle: h4_black,
                                      hintStyle: h4_black),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Divider(
                                    color: color7,
                                    height: 2,
                                  ),
                                ),
                              ],
                            )
                          : _selectedProtocol == "L2TP"
                              ? Column(
                                  children: [
                                    TextField(
                                      style: h4_black,
                                      textAlign: TextAlign.right,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              10, 10, 10, 10),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: color4)),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: color4)),
                                          hintText: 'Required',
                                          labelText: 'Remark',
                                          labelStyle: h4_black,
                                          hintStyle: h4_black),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: Divider(
                                        color: color7,
                                        height: 2,
                                      ),
                                    ),
                                    TextField(
                                      style: h4_black,
                                      textAlign: TextAlign.right,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              10, 10, 10, 10),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: color4)),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: color4)),
                                          hintText: 'Required',
                                          labelText: 'Server Address',
                                          labelStyle: h4_black,
                                          hintStyle: h4_black),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: Divider(
                                        color: color7,
                                        height: 2,
                                      ),
                                    ),
                                    TextField(
                                      style: h4_black,
                                      textAlign: TextAlign.right,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              10, 10, 10, 10),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: color4)),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: color4)),
                                          hintText: 'Required',
                                          labelText: 'IPSec PSK',
                                          labelStyle: h4_black,
                                          hintStyle: h4_black),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: Divider(
                                        color: color7,
                                        height: 2,
                                      ),
                                    ),
                                    TextField(
                                      style: h4_black,
                                      textAlign: TextAlign.right,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              10, 10, 10, 10),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: color4)),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: color4)),
                                          hintText: 'Required',
                                          labelText: 'Username',
                                          labelStyle: h4_black,
                                          hintStyle: h4_black),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: Divider(
                                        color: color7,
                                        height: 2,
                                      ),
                                    ),
                                    TextField(
                                      style: h4_black,
                                      obscureText: true,
                                      textAlign: TextAlign.right,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.fromLTRB(
                                              10, 10, 10, 10),
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: color4)),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide:
                                                  BorderSide(color: color4)),
                                          hintText: 'Required',
                                          labelText: 'Password',
                                          labelStyle: h4_black,
                                          hintStyle: h4_black),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: Divider(
                                        color: color7,
                                        height: 2,
                                      ),
                                    ),
                                  ],
                                )
                              : _selectedProtocol == "VMESS"
                                  ? Column(
                                      children: [
                                        TextField(
                                          style: h4_black,
                                          textAlign: TextAlign.right,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets
                                                  .fromLTRB(10, 10, 10, 10),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: color4)),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: color4)),
                                              hintText: 'Required',
                                              labelText: 'Remark',
                                              labelStyle: h4_black,
                                              hintStyle: h4_black),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
                                          child: Divider(
                                            color: color7,
                                            height: 2,
                                          ),
                                        ),
                                        TextField(
                                          style: h4_black,
                                          textAlign: TextAlign.right,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets
                                                  .fromLTRB(10, 10, 10, 10),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: color4)),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: color4)),
                                              hintText: 'Required',
                                              labelText: 'Server Address',
                                              labelStyle: h4_black,
                                              hintStyle: h4_black),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
                                          child: Divider(
                                            color: color7,
                                            height: 2,
                                          ),
                                        ),
                                        TextField(
                                          style: h4_black,
                                          textAlign: TextAlign.right,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets
                                                  .fromLTRB(10, 10, 10, 10),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: color4)),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: color4)),
                                              hintText: 'Required',
                                              labelText: 'Port',
                                              labelStyle: h4_black,
                                              hintStyle: h4_black),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
                                          child: Divider(
                                            color: color7,
                                            height: 2,
                                          ),
                                        ),
                                        TextField(
                                          style: h4_black,
                                          textAlign: TextAlign.right,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets
                                                  .fromLTRB(10, 10, 10, 10),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: color4)),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: color4)),
                                              hintText: 'Required',
                                              labelText: 'UUID',
                                              labelStyle: h4_black,
                                              hintStyle: h4_black),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
                                          child: Divider(
                                            color: color7,
                                            height: 2,
                                          ),
                                        ),
                                        TextField(
                                          style: h4_black,
                                          textAlign: TextAlign.right,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets
                                                  .fromLTRB(10, 10, 10, 10),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: color4)),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: color4)),
                                              hintText: 'Required',
                                              labelText: 'Alter ID',
                                              labelStyle: h4_black,
                                              hintStyle: h4_black),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
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
                                      ],
                                    )
                                  : _selectedProtocol == "Trojan"
                                      ? Column(
                                          children: [
                                            TextField(
                                              style: h4_black,
                                              textAlign: TextAlign.right,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 10, 10, 10),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color:
                                                                      color4)),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color:
                                                                      color4)),
                                                  hintText: 'Required',
                                                  labelText: 'Remark',
                                                  labelStyle: h4_black,
                                                  hintStyle: h4_black),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 10, 0),
                                              child: Divider(
                                                color: color7,
                                                height: 2,
                                              ),
                                            ),
                                            TextField(
                                              style: h4_black,
                                              textAlign: TextAlign.right,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 10, 10, 10),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color:
                                                                      color4)),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color:
                                                                      color4)),
                                                  hintText: 'Required',
                                                  labelText: 'Server Address',
                                                  labelStyle: h4_black,
                                                  hintStyle: h4_black),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 10, 0),
                                              child: Divider(
                                                color: color7,
                                                height: 2,
                                              ),
                                            ),
                                            TextField(
                                              style: h4_black,
                                              textAlign: TextAlign.right,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 10, 10, 10),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color:
                                                                      color4)),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color:
                                                                      color4)),
                                                  hintText: 'Required',
                                                  labelText: 'Port',
                                                  labelStyle: h4_black,
                                                  hintStyle: h4_black),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 10, 0),
                                              child: Divider(
                                                color: color7,
                                                height: 2,
                                              ),
                                            ),
                                            TextField(
                                              style: h4_black,
                                              obscureText: true,
                                              textAlign: TextAlign.right,
                                              decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 10, 10, 10),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color:
                                                                      color4)),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color:
                                                                      color4)),
                                                  hintText: 'Required',
                                                  labelText: 'Password',
                                                  labelStyle: h4_black,
                                                  hintStyle: h4_black),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 0, 10, 0),
                                              child: Divider(
                                                color: color7,
                                                height: 2,
                                              ),
                                            ),
                                          ],
                                        )
                                      : Container(),
            ),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
