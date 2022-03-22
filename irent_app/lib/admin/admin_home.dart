import 'package:flutter/material.dart';
import 'package:irent_app/user_store_uroc.dart';
import 'package:irent_app/admin/admin_add_store.dart';
import 'dart:ui';
import '../app_icons.dart';

class admin_home extends StatefulWidget {
  const admin_home({Key? key}) : super(key: key);

  @override
  _admin_homeState createState() => _admin_homeState();
}

class _admin_homeState extends State<admin_home> {
  final Color marigold = const Color(0xFFECA400);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: marigold,
              heroTag: 'add_store',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddStorePage()));
              },
              child: Icon(
                Icons.add,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsetsDirectional.only(start: 38),
            child: Column(children: [
              Container(
                height: 35,
                width: 126,
                //color: Colors.blue,
                margin: EdgeInsets.only(left: 10.0),
                child: Text(
                  'Stores',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 29, 74, 1),
                    fontFamily: 'SF Pro Rounded',
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ]),
          ),
          InkWell(
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 20,
                    width: 264,
                    margin: EdgeInsets.only(top: 22),
                    child: Text(
                      'UROC @ Student Activities Centre',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(251, 251, 255, 1),
                          fontFamily: 'SF Pro Rounded',
                          fontSize: 17,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 42,
                    width: 266,
                    margin: EdgeInsets.only(top: 5),
                    child: Text(
                      'North Spine, NS3-01-03, 50 Nanyang Ave, Block N3.1, Singapore 639798',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(251, 251, 255, 1),
                          fontFamily: 'SF Pro Rounded',
                          fontSize: 12,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    height: 14,
                    width: 266,
                    margin: EdgeInsets.only(top: 24),
                    child: Text(
                      'Category: Recreational Games',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(251, 251, 255, 1),
                          fontFamily: 'SF Pro Rounded',
                          fontSize: 12,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              height: 150,
              width: 317,
              margin: EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 29, 74, 0.6000000238418579),
                        offset: Offset(0, 4),
                        blurRadius: 4),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  image: new DecorationImage(
                    image: AssetImage('images/uroc.jpeg'),
                    colorFilter: new ColorFilter.mode(
                        Color.fromRGBO(0, 29, 74, 0.6000000238418579),
                        BlendMode.hardLight),
                    fit: BoxFit.cover,
                  )),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => user_store_uroc()),
              );
            },
          ),
          InkWell(
            child: Container(
              child: Column(
                children: [
                  Container(
                      height: 42,
                      width: 261,
                      margin: EdgeInsets.only(top: 22),
                      child: Text(
                        'Centre for Information Sciences and Systems (CISS)',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(251, 251, 255, 1),
                            fontFamily: 'SF Pro Rounded',
                            fontSize: 18,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.bold),
                      )),
                  Container(
                      height: 14,
                      width: 266,
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        '50 Nanyang Ave S2-B4b-05, Singapore 639798',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(251, 251, 255, 1),
                            fontFamily: 'SF Pro Rounded',
                            fontSize: 12,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600),
                      )),
                  Container(
                      height: 14,
                      width: 266,
                      margin: EdgeInsets.only(top: 25),
                      child: Text(
                        'Category: EEE Laboratories',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(251, 251, 255, 1),
                            fontFamily: 'SF Pro Rounded',
                            fontSize: 12,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600),
                      )),
                ],
              ),
              height: 150,
              width: 317,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 29, 74, 0.6000000238418579),
                        offset: Offset(0, 4),
                        blurRadius: 4),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  image: new DecorationImage(
                    image: AssetImage('images/Image_ciss.png'),
                    colorFilter: new ColorFilter.mode(
                        Color.fromRGBO(0, 29, 74, 0.6000000238418579),
                        BlendMode.hardLight),
                    fit: BoxFit.cover,
                  )),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
