import 'package:flutter/material.dart';
import 'package:irent_app/user_notcollect.dart';

class user_bookings extends StatefulWidget {
  const user_bookings({Key? key}) : super(key: key);

  @override
  _user_bookingsState createState() => _user_bookingsState();
}

class _user_bookingsState extends State<user_bookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                  height: 45,
                  width: 248,
                  margin: EdgeInsets.only(left: 45, top: 10),
                  child: Text(
                    'Confirmed Bookings',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 29, 74, 1),
                        fontFamily: 'SF Pro Rounded',
                        fontSize: 25,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w600,
                        height: 1),
                  )),
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => user_notcollect()));
                },
                child: Container(
                    margin: EdgeInsets.only(top: 12.5),
                    alignment: Alignment.bottomCenter,
                    height: 141,
                    width: 326,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(129, 164, 205, 1),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 30),
                          height: 48,
                          width: 48,
                          color: Colors.black,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                    height: 18,
                                    width: 165,
                                    margin: EdgeInsets.only(top: 20, left: 15),
                                    child: Text(
                                      'Wii Game Console',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 29, 74, 1),
                                          fontFamily: 'SF Pro Rounded',
                                          fontSize: 15,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w500,
                                          height: 1),
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    height: 14,
                                    width: 165,
                                    margin: EdgeInsets.only(top: 5, left: 15),
                                    child: Text(
                                      'Qty: 2   |   Price: \$4',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 29, 74, 1),
                                          fontFamily: 'SF Pro Rounded',
                                          fontSize: 12,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    height: 14,
                                    width: 165,
                                    margin: EdgeInsets.only(top: 5, left: 15),
                                    child: Text(
                                      'Date: 01/01/2020 - 01/01/2020',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 29, 74, 1),
                                          fontFamily: 'SF Pro Rounded',
                                          fontSize: 12,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    height: 14,
                                    width: 165,
                                    margin: EdgeInsets.only(top: 5, left: 15),
                                    child: Text(
                                      'Collection Time: 1 PM',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 29, 74, 1),
                                          fontFamily: 'SF Pro Rounded',
                                          fontSize: 12,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    height: 14,
                                    width: 165,
                                    margin: EdgeInsets.only(top: 5, left: 15),
                                    child: Text(
                                      'Return Time: 3 PM',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 29, 74, 1),
                                          fontFamily: 'SF Pro Rounded',
                                          fontSize: 12,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ))
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                    height: 20,
                                    width: 30,
                                    margin: EdgeInsets.only(top: 20, left: 15),
                                    child: Text(
                                      '# 99',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 29, 74, 1),
                                          fontFamily: 'SF Pro Rounded',
                                          fontSize: 15,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 35,
                                  width: 35,
                                  margin: EdgeInsets.only(top: 20, left: 15),
                                  child: Icon(Icons.arrow_forward_ios_outlined),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    )),
              )
            ],
          ),
          Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 12.5),
                  alignment: Alignment.bottomCenter,
                  height: 141,
                  width: 326,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(129, 164, 205, 1),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30),
                        height: 48,
                        width: 48,
                        color: Colors.black,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                  height: 18,
                                  width: 165,
                                  margin: EdgeInsets.only(top: 20, left: 15),
                                  child: Text(
                                    'Wii Game Console',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 29, 74, 1),
                                        fontFamily: 'SF Pro Rounded',
                                        fontSize: 15,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w500,
                                        height: 1),
                                  ))
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  height: 14,
                                  width: 165,
                                  margin: EdgeInsets.only(top: 5, left: 15),
                                  child: Text(
                                    'Qty: 2   |   Price: \$4',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 29, 74, 1),
                                        fontFamily: 'SF Pro Rounded',
                                        fontSize: 12,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ))
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  height: 14,
                                  width: 165,
                                  margin: EdgeInsets.only(top: 5, left: 15),
                                  child: Text(
                                    'Date: 01/01/2020 - 01/01/2020',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 29, 74, 1),
                                        fontFamily: 'SF Pro Rounded',
                                        fontSize: 12,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ))
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  height: 14,
                                  width: 165,
                                  margin: EdgeInsets.only(top: 5, left: 15),
                                  child: Text(
                                    'Collection Time: 1 PM',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 29, 74, 1),
                                        fontFamily: 'SF Pro Rounded',
                                        fontSize: 12,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ))
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  height: 14,
                                  width: 165,
                                  margin: EdgeInsets.only(top: 5, left: 15),
                                  child: Text(
                                    'Return Time: 3 PM',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 29, 74, 1),
                                        fontFamily: 'SF Pro Rounded',
                                        fontSize: 12,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ))
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                  height: 20,
                                  width: 30,
                                  margin: EdgeInsets.only(top: 20, left: 15),
                                  child: Text(
                                    '# 99',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 29, 74, 1),
                                        fontFamily: 'SF Pro Rounded',
                                        fontSize: 15,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ))
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                margin: EdgeInsets.only(top: 20, left: 15),
                                child: Icon(Icons.arrow_forward_ios_outlined),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
