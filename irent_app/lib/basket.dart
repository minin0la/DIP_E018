import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart' as intl;
import 'package:irent_app/app_icons.dart';
import 'package:irent_app/checkbox.dart';
import 'package:irent_app/date.dart';
import 'increment_decrement.dart';
import 'package:irent_app/switch_nav.dart';
import 'package:irent_app/time.dart';
import 'homepage.dart';
import 'constants.dart';
import 'user_payment.dart';
import 'package:irent_app/switch_nav.dart';

class basket extends StatefulWidget {
  final product_displayPicture;
  final product_name;
  final product_category;
  final product_price;
  final product_count;
  final product_starttime;
  final product_endtime;
  final product_startdate;
  final product_enddate;
  basket(
      {this.product_displayPicture,
      this.product_name,
      this.product_category,
      this.product_price,
      this.product_count,
      this.product_enddate,
      this.product_endtime,
      this.product_startdate,
      this.product_starttime});

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  State<basket> createState() => _basketState();
}

class _basketState extends State<basket> {
  final Color white = const Color(0xFFFBFBFF);
  final Color oxford = const Color(0xFF001D4A);
  final Color aliceblue = const Color(0xFF81A4CD);
  final Color iceberg = const Color(0xFFDBE4EE);
  final Color marigold = const Color(0xFFECA400);
  final Color transparent = const Color(0x4DE3E3E3);
  bool _value = false;
  DateTime dateTime1 = DateTime(2022);
  DateTime dateTime2 = DateTime(2022);
  String initialValue1 = '12 AM';
  String initialValue2 = '12 AM';

  var itemList = [
    '12 AM',
    '1 AM',
    '2 AM',
    '3 AM',
    '4 AM',
    '5 AM',
    '6 AM',
    '7 AM',
    '8 AM',
    '9 AM',
    '10 AM',
    '11 AM',
    '12 PM',
    '1 PM',
    '2 PM',
    '3 PM',
    '4 PM',
    '5 PM',
    '6 PM',
    '7 PM',
    '8 PM',
    '9 PM',
    '10 PM',
    '11 PM',
  ];

  int _count = 1;

  void _increamentCount() {
    setState(() {
      _count++;
    });
  }

  void _decreamentCount() {
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      body: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
          child: Text(
            'Basket',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: oxford,
                fontFamily: 'SF_Pro_Rounded',
                fontSize: 25,
                fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width * 0.85,
          child: Card(
            color: Color(0xFF81A4CD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 35.0, top: 15, bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: new DecorationImage(
                        image: AssetImage(widget.product_displayPicture),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.product_name}',
                        style: TextStyle(
                          fontFamily: 'SF_Pro_Rounded',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF001D4A),
                        ),
                      ),
                      Text(
                        '\$${widget.product_price} / Hour',
                        style: TextStyle(
                          fontFamily: 'SF_Pro_Rounded',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF001D4A),
                        ),
                      ),
                      Text('Start Date             End Date',
                          style: TextStyle(
                            fontFamily: 'SF_Pro_Rounded',
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF001D4A),
                            wordSpacing: 1,
                          )),
                      Row(
                        children: [
                          Container(
                            child: Row(
                              children: <Widget>[
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 105,
                                          child: Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: ElevatedButton.icon(
                                                onPressed: () async {
                                                  DateTime? newDate1 =
                                                      await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              dateTime1,
                                                          firstDate:
                                                              DateTime(1900),
                                                          lastDate:
                                                              DateTime(2300));
                                                  if (newDate1 != null) {
                                                    setState(() {
                                                      dateTime1 = newDate1;
                                                    });
                                                  }
                                                },
                                                icon: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: Color.fromRGBO(
                                                      0, 29, 74, 1),
                                                  size: 20,
                                                ),
                                                label: Text(
                                                    '${widget.product_startdate}',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            0, 29, 74, 1),
                                                        fontFamily:
                                                            'SF Pro Rounded',
                                                        fontSize: 10,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.normal)),
                                                style: ElevatedButton.styleFrom(
                                                  fixedSize:
                                                      const Size(158, 41),
                                                  primary: Color.fromRGBO(
                                                      219, 228, 238, 1),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 30, width: 5)
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 105,
                                      child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: ElevatedButton.icon(
                                            onPressed: () async {
                                              DateTime? newDate2 =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate: dateTime2,
                                                      firstDate: DateTime(1900),
                                                      lastDate: DateTime(2300));
                                              if (newDate2 != null) {
                                                setState(() {
                                                  dateTime2 = newDate2;
                                                });
                                              }
                                            },
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              color:
                                                  Color.fromRGBO(0, 29, 74, 1),
                                              size: 20,
                                            ),
                                            label: Text(
                                                '${widget.product_enddate}',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 29, 74, 1),
                                                    fontFamily:
                                                        'SF Pro Rounded',
                                                    fontSize: 10,
                                                    letterSpacing: 0,
                                                    fontWeight:
                                                        FontWeight.normal)),
                                            style: ElevatedButton.styleFrom(
                                              fixedSize: const Size(158, 41),
                                              primary: Color.fromRGBO(
                                                  219, 228, 238, 1),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text('Start Time             End Time',
                          style: TextStyle(
                            fontFamily: 'SF_Pro_Rounded',
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF001D4A),
                            wordSpacing: 1,
                          )),
                      Row(
                        children: [
                          Container(
                            child: Row(
                              children: <Widget>[
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 105,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Color.fromRGBO(
                                                  219, 228, 238, 1),
                                              fixedSize: const Size(158, 41),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Container(
                                              child: DropdownButton(
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 29, 74, 1),
                                                    fontSize: 10),
                                                dropdownColor: Color.fromRGBO(
                                                    219, 228, 238, 1),
                                                icon: Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: Color.fromRGBO(
                                                        0, 29, 74, 1)),
                                                underline: Container(),
                                                value: initialValue1,
                                                onChanged: (value1) {
                                                  setState(() {
                                                    initialValue1 =
                                                        value1.toString();
                                                  });
                                                },
                                                menuMaxHeight: 150,
                                                focusNode: FocusNode(),
                                                isExpanded: true,
                                                items: itemList.map((item1) {
                                                  return DropdownMenuItem(
                                                      value: item1,
                                                      child: Text(
                                                          '${widget.product_starttime}'));
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                      width: 5,
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 105,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Color.fromRGBO(219, 228, 238, 1),
                                          fixedSize: const Size(158, 41),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Container(
                                          child: DropdownButton(
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    0, 29, 74, 1),
                                                fontSize: 10),
                                            dropdownColor: Color.fromRGBO(
                                                219, 228, 238, 1),
                                            icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                color: Color.fromRGBO(
                                                    0, 29, 74, 1)),
                                            underline: Container(),
                                            value: initialValue2,
                                            onChanged: (value2) {
                                              setState(() {
                                                initialValue2 =
                                                    value2.toString();
                                              });
                                            },
                                            menuMaxHeight: 150,
                                            focusNode: FocusNode(),
                                            isExpanded: true,
                                            items: itemList.map((item2) {
                                              return DropdownMenuItem(
                                                  value: item2,
                                                  child: Text(
                                                      '${widget.product_endtime}'));
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(children: [
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(219, 228, 238, 1),
                                    shape: BoxShape.circle),
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _count -= 1;
                                      });
                                    },
                                    child: Icon(Icons.remove,
                                        color: Color.fromRGBO(0, 29, 74, 1),
                                        size: 20)),
                              ),
                              SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Text(
                                    '${widget.product_count}',
                                    textAlign: TextAlign.center,
                                  )),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(219, 228, 238, 1),
                                    shape: BoxShape.circle),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _count += 1;
                                    });
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Color.fromRGBO(0, 29, 74, 1),
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ])
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          children: [
            Container(
                margin: EdgeInsets.only(left: 20, top: 12.5),
                alignment: Alignment.bottomCenter,
                height: 100,
                width: 412,
                color: Color(0xFFFBFBFF),
                child: Row(
                  children: [
                    checkbox(),
                    Container(
                      child: Text('All'),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 100),
                      height: 58,
                      width: 67,
                      child: Column(
                        children: [
                          Container(
                              height: 21,
                              width: 126,
                              child: Text(
                                'Total',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xFF001D4A),
                                    fontFamily: 'SF Pro Rounded',
                                    fontSize: 16,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                    height: 1),
                              )),
                          Container(
                              height: 25,
                              width: 126,
                              child: Text(
                                '\$2',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xFF001D4A),
                                    fontFamily: 'SF Pro Rounded',
                                    fontSize: 30,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                    height: 1),
                              )),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        InkWell(
                          child: Container(
                              margin: EdgeInsets.only(top: 22),
                              height: 53,
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32),
                                  topRight: Radius.circular(32),
                                  bottomLeft: Radius.circular(32),
                                  bottomRight: Radius.circular(32),
                                ),
                                color: Color.fromRGBO(236, 164, 0, 1),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Book',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'SF Pro Rounded',
                                    fontSize: 18,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => user_payment(
                                        product_displayPicture:
                                            widget.product_displayPicture,
                                        product_price: widget.product_price,
                                        product_startdate:
                                            widget.product_startdate,
                                        product_enddate: widget.product_enddate,
                                        product_starttime:
                                            widget.product_starttime,
                                        product_endtime: widget.product_endtime,
                                        product_count: widget.product_count,
                                        product_name: widget.product_name,
                                      )),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ]),
      //bottomNavigationBar: SwitchNavBar(),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the buttons

  Widget noButton = TextButton(
    child: Text("No"),
    onPressed: () {},
  );
  Widget yesButton = TextButton(
    child: Text("Yes"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    //title: Text("Notice"),
    content: Text("Do you want to remove this?"),
    actions: [
      noButton,
      yesButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
