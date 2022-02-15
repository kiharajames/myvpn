import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myvpn/colors.dart';
import 'package:myvpn/screens/drawer.dart';

class Subscription extends StatefulWidget {
  var notLogged;
  Subscription({Key? key, this.notLogged}) : super(key: key);

  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  int selected = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawers(),
      appBar: AppBar(
        backgroundColor: color4,
        leading: Builder(
          builder: (context) {
            if (widget.notLogged == 1) {
              return IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: color1,
                  ));
            }
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.menu_open,
                  color: color1,
                ));
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Service',
              textAlign: TextAlign.center,
              style: h3,
            ),
          ],
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Navigator.pop(context);
        //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //             backgroundColor: color3,
        //             content: Text(
        //               'Subscribed Successfully',
        //               style: h4_white,
        //             )));
        //       },
        //       icon: Icon(
        //         Icons.check,
        //         color: color1,
        //       ))
        // ],
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                    flex: 1,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = 1;
                              });
                            },
                            child: selected == 1
                                ? Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                        color: color6,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 20, 5, 20),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Yearly',
                                              style: h2,
                                            ),
                                            Text(
                                              '\$60/Year ',
                                              style: h2,
                                            ),
                                            Text(
                                              '\$5/month',
                                              style: h4_white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                        color: color11.withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 20, 5, 20),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Yearly',
                                              style: h2_blue,
                                            ),
                                            Text(
                                              '\$60/Year ',
                                              style: h2_blue,
                                            ),
                                            Text(
                                              '\$5/month',
                                              style: h4_blue,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                        Positioned(
                            child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                                color: color6,
                                border: Border.all(color: color4, width: 1.0),
                                borderRadius: BorderRadius.circular(2)),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Save 20%',
                                style: h4_white,
                              ),
                            ),
                          ),
                        ))
                      ],
                    )),
                Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = 2;
                          });
                        },
                        child: selected == 2
                            ? Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    color: color6,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Monthly',
                                        style: h2,
                                      ),
                                      Text(
                                        '\$6/mo ',
                                        style: h2,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                                height: 150,
                                decoration: BoxDecoration(
                                    color: color11.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Monthly',
                                        style: h2_blue,
                                      ),
                                      Text(
                                        '\$6/mo ',
                                        style: h2_blue,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(
                Icons.check,
                color: color6,
                size: 40,
              ),
              title: Text(
                  'Cisco IPSec, AnyConnect, WebVPN with Unlimited Traffic'),
            ),
            ListTile(
              leading: Icon(
                Icons.check,
                color: color6,
                size: 40,
              ),
              title: Text('VMESS/Trojan/VLESS with 100G/m'),
            ),
            ListTile(
              leading: Icon(
                Icons.check,
                color: color6,
                size: 40,
              ),
              title: Text('Unlock Stream video and website'),
            ),
            ListTile(
              leading: Icon(
                Icons.check,
                color: color6,
                size: 40,
              ),
              title: Text('Support PC and mobile phone'),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: color6,
              onPressed: () {},
              minWidth: MediaQuery.of(context).size.width,
              height: 60,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                'Subscribe to Mix Service',
                style: h4_white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Subscriptions billed as recurring billing in default. Cancel anytime.',
              textAlign: TextAlign.center,
              style: h5_grey,
            )
          ],
        ),
      ),
    );
  }
}
