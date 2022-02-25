import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class user_basket extends StatefulWidget {
  const user_basket({Key? key}) : super(key: key);

  @override
  _user_basketState createState() => _user_basketState();
}

class _user_basketState extends State<user_basket> {
  DateTime dateTime = DateTime(2022);
  TimeOfDay _time = TimeOfDay.now();
  String initialValue = '12 AM';

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

  int _count = 0;

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
                    'Basket',
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
                onTap: () {},
                child: Container(
                    margin: EdgeInsets.only(top: 12.5),
                    alignment: Alignment.bottomCenter,
                    height: 190,
                    width: 340,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(129, 164, 205, 1),
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20, left: 10),
                              height: 28,
                              width: 28,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 60, left: 10),
                              height: 48,
                              width: 48,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(children: [
                                  Container(
                                      height: 20,
                                      width: 180,
                                      margin: EdgeInsets.only(top: 15, left: 5),
                                      child: Text(
                                        'Wii Game Console',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color.fromRGBO(0, 29, 74, 1),
                                            fontFamily: 'SF Pro Rounded',
                                            fontSize: 16,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.bold,
                                            height: 1),
                                      ))
                                ])
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    height: 20,
                                    width: 120,
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(
                                      '\$1.5 / hour',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 29, 74, 1),
                                          fontFamily: 'SF Pro Rounded',
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w500,
                                          height: 1),
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: 5),
                                        height: 18,
                                        width: 100,
                                        child: Text(
                                          'Start Date',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(0, 29, 74, 1),
                                              fontFamily: 'SF Pro Rounded',
                                              fontSize: 12,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        )),
                                    Container(
                                      height: 24,
                                      width: 100,
                                      child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: ElevatedButton.icon(
                                            onPressed: () async {
                                              DateTime? newDate =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate: dateTime,
                                                      firstDate: DateTime(1900),
                                                      lastDate: DateTime(2300));
                                              if (newDate != null) {
                                                setState(() {
                                                  dateTime = newDate;
                                                });
                                              }
                                            },
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              color:
                                                  Color.fromRGBO(0, 29, 74, 1),
                                            ),
                                            label: Text(
                                                '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 29, 74, 1),
                                                    fontFamily:
                                                        'SF Pro Rounded',
                                                    fontSize: 9,
                                                    letterSpacing: 0,
                                                    fontWeight:
                                                        FontWeight.w400)),
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
                                Column(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: 5),
                                        height: 18,
                                        width: 100,
                                        child: Text(
                                          'End Date',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(0, 29, 74, 1),
                                              fontFamily: 'SF Pro Rounded',
                                              fontSize: 12,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        )),
                                    Container(
                                      height: 24,
                                      width: 100,
                                      child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: ElevatedButton.icon(
                                            onPressed: () async {
                                              DateTime? newDate =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate: dateTime,
                                                      firstDate: DateTime(1900),
                                                      lastDate: DateTime(2300));
                                              if (newDate != null) {
                                                setState(() {
                                                  dateTime = newDate;
                                                });
                                              }
                                            },
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              color:
                                                  Color.fromRGBO(0, 29, 74, 1),
                                            ),
                                            label: Text(
                                                '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 29, 74, 1),
                                                    fontFamily:
                                                        'SF Pro Rounded',
                                                    fontSize: 9,
                                                    letterSpacing: 0,
                                                    fontWeight:
                                                        FontWeight.w400)),
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
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.only(left: 5, top: 5),
                                        height: 18,
                                        width: 100,
                                        child: Text(
                                          'Start Time',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(0, 29, 74, 1),
                                              fontFamily: 'SF Pro Rounded',
                                              fontSize: 12,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        )),
                                    Container(
                                      height: 24,
                                      width: 100,
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
                                            value: initialValue,
                                            onChanged: (value) {
                                              setState(() {
                                                initialValue = value.toString();
                                              });
                                            },
                                            menuMaxHeight: 150,
                                            focusNode: FocusNode(),
                                            isExpanded: true,
                                            items: itemList.map((itemone) {
                                              return DropdownMenuItem(
                                                  value: itemone,
                                                  child: Text(itemone));
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.only(left: 5, top: 5),
                                        height: 18,
                                        width: 100,
                                        child: Text(
                                          'End Time',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(0, 29, 74, 1),
                                              fontFamily: 'SF Pro Rounded',
                                              fontSize: 12,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        )),
                                    Container(
                                      height: 24,
                                      width: 100,
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
                                            value: initialValue,
                                            onChanged: (value) {
                                              setState(() {
                                                initialValue = value.toString();
                                              });
                                            },
                                            menuMaxHeight: 150,
                                            focusNode: FocusNode(),
                                            isExpanded: true,
                                            items: itemList.map((itemone) {
                                              return DropdownMenuItem(
                                                  value: itemone,
                                                  child: Text(itemone));
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 125,
                                  height: 25,
                                  margin: EdgeInsets.only(top: 10, left: 42),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FloatingActionButton(
                                          backgroundColor:
                                              Color.fromRGBO(219, 228, 238, 1),
                                          child: Icon(Icons.add,
                                              color:
                                                  Color.fromRGBO(0, 29, 74, 1)),
                                          onPressed: _increamentCount),
                                      Text('${_count}'),
                                      FloatingActionButton(
                                        backgroundColor:
                                            Color.fromRGBO(219, 228, 238, 1),
                                        child: Icon(Icons.remove,
                                            color:
                                                Color.fromRGBO(0, 29, 74, 1)),
                                        onPressed: _decreamentCount,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  showAlertDialog(context);
                                },
                                child: Container(
                                  height: 15,
                                  width: 15,
                                  margin: EdgeInsets.only(top: 10),
                                  child: Icon(Icons.close),
                                ))
                          ],
                        )
                      ],
                    )),
              )
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                    margin: EdgeInsets.only(top: 12.5),
                    alignment: Alignment.bottomCenter,
                    height: 190,
                    width: 340,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(129, 164, 205, 1),
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20, left: 10),
                              height: 28,
                              width: 28,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 60, left: 10),
                              height: 48,
                              width: 48,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(children: [
                                  Container(
                                      height: 20,
                                      width: 180,
                                      margin: EdgeInsets.only(top: 15, left: 5),
                                      child: Text(
                                        'Wii Game Console',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color.fromRGBO(0, 29, 74, 1),
                                            fontFamily: 'SF Pro Rounded',
                                            fontSize: 16,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.bold,
                                            height: 1),
                                      ))
                                ])
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    height: 20,
                                    width: 120,
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(
                                      '\$1.5 / hour',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 29, 74, 1),
                                          fontFamily: 'SF Pro Rounded',
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w500,
                                          height: 1),
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: 5),
                                        height: 18,
                                        width: 100,
                                        child: Text(
                                          'Start Date',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(0, 29, 74, 1),
                                              fontFamily: 'SF Pro Rounded',
                                              fontSize: 12,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        )),
                                    Container(
                                      height: 24,
                                      width: 100,
                                      child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: ElevatedButton.icon(
                                            onPressed: () async {
                                              DateTime? newDate =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate: dateTime,
                                                      firstDate: DateTime(1900),
                                                      lastDate: DateTime(2300));
                                              if (newDate != null) {
                                                setState(() {
                                                  dateTime = newDate;
                                                });
                                              }
                                            },
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              color:
                                                  Color.fromRGBO(0, 29, 74, 1),
                                            ),
                                            label: Text(
                                                '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 29, 74, 1),
                                                    fontFamily:
                                                        'SF Pro Rounded',
                                                    fontSize: 9,
                                                    letterSpacing: 0,
                                                    fontWeight:
                                                        FontWeight.w400)),
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
                                Column(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: 5),
                                        height: 18,
                                        width: 100,
                                        child: Text(
                                          'End Date',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(0, 29, 74, 1),
                                              fontFamily: 'SF Pro Rounded',
                                              fontSize: 12,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        )),
                                    Container(
                                      height: 24,
                                      width: 100,
                                      child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: ElevatedButton.icon(
                                            onPressed: () async {
                                              DateTime? newDate =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate: dateTime,
                                                      firstDate: DateTime(1900),
                                                      lastDate: DateTime(2300));
                                              if (newDate != null) {
                                                setState(() {
                                                  dateTime = newDate;
                                                });
                                              }
                                            },
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              color:
                                                  Color.fromRGBO(0, 29, 74, 1),
                                            ),
                                            label: Text(
                                                '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 29, 74, 1),
                                                    fontFamily:
                                                        'SF Pro Rounded',
                                                    fontSize: 9,
                                                    letterSpacing: 0,
                                                    fontWeight:
                                                        FontWeight.w400)),
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
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.only(left: 5, top: 5),
                                        height: 18,
                                        width: 100,
                                        child: Text(
                                          'Start Time',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(0, 29, 74, 1),
                                              fontFamily: 'SF Pro Rounded',
                                              fontSize: 12,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        )),
                                    Container(
                                      height: 24,
                                      width: 100,
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
                                            value: initialValue,
                                            onChanged: (value) {
                                              setState(() {
                                                initialValue = value.toString();
                                              });
                                            },
                                            menuMaxHeight: 150,
                                            focusNode: FocusNode(),
                                            isExpanded: true,
                                            items: itemList.map((itemone) {
                                              return DropdownMenuItem(
                                                  value: itemone,
                                                  child: Text(itemone));
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                        margin:
                                            EdgeInsets.only(left: 5, top: 5),
                                        height: 18,
                                        width: 100,
                                        child: Text(
                                          'End Time',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(0, 29, 74, 1),
                                              fontFamily: 'SF Pro Rounded',
                                              fontSize: 12,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.normal,
                                              height: 1),
                                        )),
                                    Container(
                                      height: 24,
                                      width: 100,
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
                                            value: initialValue,
                                            onChanged: (value) {
                                              setState(() {
                                                initialValue = value.toString();
                                              });
                                            },
                                            menuMaxHeight: 150,
                                            focusNode: FocusNode(),
                                            isExpanded: true,
                                            items: itemList.map((itemone) {
                                              return DropdownMenuItem(
                                                  value: itemone,
                                                  child: Text(itemone));
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 125,
                                  height: 25,
                                  margin: EdgeInsets.only(top: 10, left: 42),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FloatingActionButton(
                                          backgroundColor:
                                              Color.fromRGBO(219, 228, 238, 1),
                                          child: Icon(Icons.add,
                                              color:
                                                  Color.fromRGBO(0, 29, 74, 1)),
                                          onPressed: _increamentCount),
                                      Text('${_count}'),
                                      FloatingActionButton(
                                        backgroundColor:
                                            Color.fromRGBO(219, 228, 238, 1),
                                        child: Icon(Icons.remove,
                                            color:
                                                Color.fromRGBO(0, 29, 74, 1)),
                                        onPressed: _decreamentCount,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap: () {
                                    showAlertDialog(context);
                                  },
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    margin: EdgeInsets.only(top: 10),
                                    child: Icon(Icons.close),
                                  ))
                            ]),
                      ],
                    )),
              )
            ],
          ),
        ],
      ),
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
