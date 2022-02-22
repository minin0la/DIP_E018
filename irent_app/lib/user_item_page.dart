import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:irent_app/app_icons.dart';
import 'package:irent_app/user_basket.dart';

class user_item_page extends StatefulWidget {
  const user_item_page({Key? key}) : super(key: key);

  @override
  _user_item_pageState createState() => _user_item_pageState();
}

class _user_item_pageState extends State<user_item_page> {
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
      body: Column(children: <Widget>[
        Container(
          height: 340,
          width: 420,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              image: DecorationImage(
                  image: AssetImage('images/Image_mariokartdeluxe.jpg'),
                  colorFilter: new ColorFilter.mode(
                      Color.fromRGBO(129, 164, 205, 0.5), BlendMode.lighten),
                  fit: BoxFit.cover)),
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 26, top: 30),
                child: Text(
                  'Mario Kart 8 Deluxe',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 29, 74, 1),
                      fontFamily: 'SF Pro Rounded',
                      fontSize: 27,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1),
                )),
          ],
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 26),
                child: Text(
                  'Console Game',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 29, 74, 1),
                      fontFamily: 'SF Pro Rounded',
                      fontSize: 18,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w300,
                      height: 1),
                )),
          ],
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 26, top: 20),
                child: Text(
                  '\$1 / Hour ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 29, 74, 1),
                      fontFamily: 'SF Pro Rounded',
                      fontSize: 18,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1),
                )),
          ],
        ),
        Row(
          children: [
            Column(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 26, top: 20),
                    height: 20,
                    width: 180,
                    child: Text(
                      'Start Date',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 29, 74, 1),
                          fontFamily: 'SF Pro Rounded',
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
                Container(
                  height: 50,
                  width: 160,
                  child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
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
                          color: Color.fromRGBO(0, 29, 74, 1),
                        ),
                        label: Text(
                            '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 29, 74, 1),
                                fontFamily: 'SF Pro Rounded',
                                fontSize: 16,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal)),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(158, 41),
                          primary: Color.fromRGBO(219, 228, 238, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      )),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 15, top: 20),
                    height: 19,
                    width: 175,
                    child: Text(
                      'End Date',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 29, 74, 1),
                          fontFamily: 'SF Pro Rounded',
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
                Container(
                  height: 50,
                  width: 160,
                  child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
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
                          color: Color.fromRGBO(0, 29, 74, 1),
                        ),
                        label: Text(
                            '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 29, 74, 1),
                                fontFamily: 'SF Pro Rounded',
                                fontSize: 16,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal)),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(158, 41),
                          primary: Color.fromRGBO(219, 228, 238, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
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
                    margin: EdgeInsets.only(left: 26, top: 20),
                    height: 20,
                    width: 180,
                    child: Text(
                      'Start Time',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 29, 74, 1),
                          fontFamily: 'SF Pro Rounded',
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
                Container(
                  height: 50,
                  width: 160,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(219, 228, 238, 1),
                      fixedSize: const Size(158, 41),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Container(
                      child: DropdownButton(
                        style: TextStyle(
                            color: Color.fromRGBO(0, 29, 74, 1), fontSize: 16),
                        dropdownColor: Color.fromRGBO(219, 228, 238, 1),
                        icon: Icon(Icons.keyboard_arrow_down,
                            color: Color.fromRGBO(0, 29, 74, 1)),
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
                              value: itemone, child: Text(itemone));
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
                    margin: EdgeInsets.only(left: 15, top: 20),
                    height: 19,
                    width: 175,
                    child: Text(
                      'End Time',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 29, 74, 1),
                          fontFamily: 'SF Pro Rounded',
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
                Container(
                  height: 50,
                  width: 160,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(219, 228, 238, 1),
                      fixedSize: const Size(158, 41),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Container(
                      child: DropdownButton(
                        style: TextStyle(
                            color: Color.fromRGBO(0, 29, 74, 1), fontSize: 16),
                        dropdownColor: Color.fromRGBO(219, 228, 238, 1),
                        icon: Icon(Icons.keyboard_arrow_down,
                            color: Color.fromRGBO(0, 29, 74, 1)),
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
                              value: itemone, child: Text(itemone));
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
                height: 22,
                width: 67,
                margin: EdgeInsets.only(left: 26, top: 20),
                child: Text(
                  'Quantity',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 29, 74, 1),
                      fontFamily: 'SF Pro Rounded',
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
          ],
        ),
        Container(
          width: 126,
          height: 40,
          margin: EdgeInsets.only(left: 250),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                  backgroundColor: Color.fromRGBO(219, 228, 238, 1),
                  child: Icon(Icons.add, color: Color.fromRGBO(0, 29, 74, 1)),
                  onPressed: _increamentCount),
              Text('${_count}'),
              FloatingActionButton(
                backgroundColor: Color.fromRGBO(219, 228, 238, 1),
                child: Icon(Icons.remove, color: Color.fromRGBO(0, 29, 74, 1)),
                onPressed: _decreamentCount,
              )
            ],
          ),
        ),
        Column(
          children: [
            Container(
                margin: EdgeInsets.only(top: 12.5),
                alignment: Alignment.bottomCenter,
                height: 100,
                width: 412,
                color: Color(0xFF001D4A),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30),
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
                                    color: Color.fromRGBO(251, 251, 255, 1),
                                    fontFamily: 'SF Pro Rounded',
                                    fontSize: 16,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                          Container(
                              height: 21,
                              width: 126,
                              child: Text(
                                '\$2',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(251, 251, 255, 1),
                                    fontFamily: 'SF Pro Rounded',
                                    fontSize: 30,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        InkWell(
                          child: Container(
                              margin: EdgeInsets.only(left: 120, top: 22),
                              height: 53,
                              width: 168,
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
                                'Add to Basket',
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
                                  builder: (context) => user_basket()),
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
    );
  }
}
