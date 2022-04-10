import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:irent_app/app_icons.dart';
import 'package:irent_app/constants.dart';
import 'package:irent_app/basket.dart';
import 'package:irent_app/constants.dart';
import 'user_store_uroc.dart';
import 'package:irent_app/date.dart';
import 'user_store_items.dart';

class user_item_page extends StatefulWidget {
  final ItemDataModel itemDataModel;
  const user_item_page({Key? key, required this.itemDataModel})
      : super(key: key);

  @override
  _user_item_pageState createState() => _user_item_pageState();
}

class _user_item_pageState extends State<user_item_page> {
  final Color white = const Color(0xFFFBFBFF);
  final Color oxford = const Color(0xFF001D4A);
  final Color aliceblue = const Color(0xFF81A4CD);
  final Color iceberg = const Color(0xFFDBE4EE);
  final Color marigold = const Color(0xFFECA400);
  final Color transparent = const Color(0x4DE3E3E3);

  DateTime? endDateTime;
  DateTime? startdate;
  DateTime? enddate;
  TimeOfDay? starttime;
  TimeOfDay? endtime;
  DateTime dateTime1 = DateTime(2022);
  DateTime dateTime2 = DateTime(2022);
  TimeOfDay _time = TimeOfDay.now();
  String initialValue1 = '12 AM';
  String initialValue2 = '12 AM';

  String getStartDateText() {
    if (startdate == null) {
      return 'Select Date';
    } else {
      return '${startdate?.day}/${startdate?.month}/${startdate?.year}';
    }
  }

  String getEndDateText() {
    if (enddate == null) {
      return 'Select Date';
    } else {
      return '${enddate?.day}/${enddate?.month}/${enddate?.year}';
    }
  }

  String getStartTimeText() {
    if (starttime == null) {
      return 'Select Time';
    } else {
      final hours = starttime?.hour.toString().padLeft(2, '0');
      final minutes = starttime?.minute.toString().padLeft(2, '0');
      return '$hours:$minutes';
    }
  }

  String getEndTimeText() {
    if (endtime == null) {
      return 'Select Time';
    } else {
      final hours = endtime?.hour.toString().padLeft(2, '0');
      final minutes = endtime?.minute.toString().padLeft(2, '0');
      return '$hours:$minutes';
    }
  }

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
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          Container(
            height: 320,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                    image: NetworkImage(widget.itemDataModel.displayPicture),
                    colorFilter: new ColorFilter.mode(
                        Color.fromRGBO(129, 164, 205, 0.5), BlendMode.lighten),
                    fit: BoxFit.cover)),
            child: InkWell(
              child: Icon(
                Icons.arrow_back,
                color: const Color(0xFF001D4A),
                size: 40,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            alignment: Alignment.bottomLeft,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  "${widget.itemDataModel.name}",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: const Color(0xFF001D4A),
                    fontFamily: 'SF Pro Rounded',
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "${widget.itemDataModel.product_category}",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: const Color(0xFF001D4A),
                    fontFamily: 'SF Pro Rounded',
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "\$${widget.itemDataModel.pricePerhour} / Hour",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: const Color(0xFF001D4A),
                    fontFamily: 'SF Pro Rounded',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
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
                    height: 40,
                    width: 160,
                    child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ElevatedButton.icon(
                          onPressed: () => pickStartDate(context),
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Color.fromRGBO(0, 29, 74, 1),
                          ),
                          label: Text(getStartDateText(),
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
                      margin: EdgeInsets.only(left: 5, top: 20),
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
                    height: 40,
                    width: 160,
                    child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ElevatedButton.icon(
                          onPressed: () => pickEndDate(context),
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Color.fromRGBO(0, 29, 74, 1),
                          ),
                          label: Text(getEndDateText(),
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
                    height: 40,
                    width: 160,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(219, 228, 238, 1),
                          fixedSize: const Size(158, 41),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () => pickStartTime(context),
                        child: Text(getStartTimeText(),
                            style: TextStyle(
                                color: Color.fromRGBO(0, 29, 74, 1),
                                fontFamily: 'SF Pro Rounded',
                                fontSize: 16,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1))
                        // child: Text('Select Time',
                        //     style: TextStyle(
                        //         color: Color.fromRGBO(0, 29, 74, 1),
                        //         fontSize: 16,
                        //         letterSpacing: 0,
                        //         fontWeight: FontWeight.normal,
                        //         height: 1)
                        //     // child: DropdownButton(
                        //     //   style: TextStyle(
                        //     //       color: Color.fromRGBO(0, 29, 74, 1),
                        //     //       fontSize: 16),
                        //     //   dropdownColor: Color.fromRGBO(219, 228, 238, 1),
                        //     //   icon: Icon(Icons.keyboard_arrow_down,
                        //     //       color: Color.fromRGBO(0, 29, 74, 1)),
                        //     //   underline: Container(),
                        //     //   value: initialValue1,
                        //     //   onChanged: (value1) {
                        //     //     setState(() {
                        //     //       initialValue1 = value1.toString();
                        //     //     });
                        //     //   },
                        //     //   menuMaxHeight: 150,
                        //     //   focusNode: FocusNode(),
                        //     //   isExpanded: true,
                        //     //   items: itemList.map((itemone) {
                        //     //     return DropdownMenuItem(
                        //     //         value: itemone, child: Text(itemone));
                        //     //   }).toList(),
                        //     // ),
                        //     ),
                        ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 5, top: 20),
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
                    height: 40,
                    width: 160,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(219, 228, 238, 1),
                        fixedSize: const Size(158, 41),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () => pickEndTime(context),
                      child: Container(
                          child: Text(getEndTimeText(),
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 29, 74, 1),
                                  fontFamily: 'SF Pro Rounded',
                                  fontSize: 16,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1))
                          // child: DropdownButton(
                          //   style: TextStyle(
                          //       color: Color.fromRGBO(0, 29, 74, 1),
                          //       fontSize: 16),
                          //   dropdownColor: Color.fromRGBO(219, 228, 238, 1),
                          //   icon: Icon(Icons.keyboard_arrow_down,
                          //       color: Color.fromRGBO(0, 29, 74, 1)),
                          //   underline: Container(),
                          //   value: initialValue2,
                          //   onChanged: (value2) {
                          //     setState(() {
                          //       initialValue2 = value2.toString();
                          //     });
                          //   },
                          //   menuMaxHeight: 150,
                          //   focusNode: FocusNode(),
                          //   isExpanded: true,
                          //   items: itemList.map((item_end) {
                          //     return DropdownMenuItem(
                          //         value: item_end, child: Text(item_end));
                          //   }).toList(),
                          // ),
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
                  margin: EdgeInsets.only(left: 26, top: 10),
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
                    heroTag: "btn1",
                    backgroundColor: Color.fromRGBO(219, 228, 238, 1),
                    child: Icon(Icons.add, color: Color.fromRGBO(0, 29, 74, 1)),
                    onPressed: _increamentCount),
                Text('${_count}'),
                FloatingActionButton(
                  heroTag: "btn2",
                  backgroundColor: Color.fromRGBO(219, 228, 238, 1),
                  child:
                      Icon(Icons.remove, color: Color.fromRGBO(0, 29, 74, 1)),
                  onPressed: _decreamentCount,
                )
              ],
            ),
          ),
        ]),
        bottomNavigationBar: Container(
            height: 100,
            color: const Color(0xFF001D4A),
            child: Column(children: [
              Container(
                child: Row(children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 30, top: 20),
                            child: Text(
                              'Total',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(251, 251, 255, 1),
                                fontFamily: 'SF Pro Rounded',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            )),
                        Container(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              '\$2',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(251, 251, 255, 1),
                                fontFamily: 'SF Pro Rounded',
                                fontSize: 30,
                                fontWeight: FontWeight.normal,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      InkWell(
                        child: Container(
                            margin: EdgeInsets.only(left: 140, top: 20),
                            height: 53,
                            width: 168,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
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
                                fontWeight: FontWeight.normal,
                              ),
                            )),
                        onTap: () {
                          addToBasket().then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => basket())));
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => basket()));
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => basket(
                          //           product_count: '$_count',
                          //           product_displayPicture:
                          //               widget.itemDataModel.displayPicture,
                          //           product_name: widget.itemDataModel.name,
                          //           product_category:
                          //               widget.itemDataModel.product_category,
                          //           product_price:
                          //               widget.itemDataModel.pricePerhour,
                          //           product_startdate:
                          //               '${dateTime1.day}/${dateTime1.month}/${dateTime1.year}',
                          //           product_enddate:
                          //               '${dateTime2.day}/${dateTime2.month}/${dateTime2.year}',
                          //           product_starttime: '$initialValue1',
                          //           product_endtime: '$initialValue2')),
                          // );
                        },
                      ),
                    ],
                  ),
                ]),
              )
            ])));
  }

  // Future pickEndDateTime(BuildContext context) async {
  //   final endingDate = await pickEndDateTime(context);
  //   if (endingDate == null) return;

  //   final endingTime = await pickEndTime(context);
  //   if (endingTime == null) return;

  //   setState(() {
  //     endDateTime = DateTime(
  //       endingDate.year,
  //       endingDate.month,
  //       endingDate.day,
  //       endingTime.hour,
  //       endingTime.minute,
  //     );
  //   });
  //   return endDateTime;
  // }

  // pickStartDateTime(BuildContext context) async {
  //   // final startingDate = await pickStartDate(context);
  //   // if (startingDate == null) return;

  //   // final startingTime = await pickStartTime(context);
  //   // if (startingTime == null) return;

  //   setState(() {
  //     startDateTime = DateTime(startDate.year, startingDate.month,
  //         startingDate.day, startingTime.hour, startingTime.minute);
  //   });
  //   return startDateTime;
  // }

  pickStartDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final startDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));

    if (startDate == null) return;

    setState(() => startdate = startDate);
    return startDate;
  }

  Future pickEndDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final endDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));

    if (endDate == null) return;

    setState(() => enddate = endDate);
    return endDate;
  }

  Future pickStartTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 12, minute: 0);
    final startTime = await showTimePicker(
        context: context, initialTime: starttime ?? initialTime);

    if (startTime == null) return;
    setState(() => starttime = startTime);
    return startTime;
  }

  Future pickEndTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 12, minute: 0);
    final endTime = await showTimePicker(
        context: context, initialTime: endtime ?? initialTime);

    if (endTime == null) return;
    setState(() => endtime = endTime);
    return endTime;
  }

  Future<void> addToBasket() async {
    var userBasket = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("basket")
        .doc(widget.itemDataModel.item_id);
    return userBasket.set({
      'product_count': '$_count',
      'product_displayPicture': widget.itemDataModel.displayPicture,
      'product_name': widget.itemDataModel.name,
      'product_category': widget.itemDataModel.product_category,
      'product_price': widget.itemDataModel.pricePerhour,
      'product_startdate': Timestamp.fromDate(dateTime1),
      'product_enddate': Timestamp.fromDate(dateTime2),
      'product_starttime': '$initialValue1',
      'product_endtime': '$initialValue2',
      'startDateTime': Timestamp.fromDate(DateTime(
          startdate!.year,
          startdate!.month,
          startdate!.day,
          starttime!.hour,
          starttime!.minute)),
      'endDateTime': Timestamp.fromDate(DateTime(enddate!.year, enddate!.month,
          enddate!.day, endtime!.hour, endtime!.minute)),
    });
  }
}

class UserBookingDataModel {
  final String bookingID, store;
  final Map itemDetails;

  UserBookingDataModel(this.bookingID, this.store, this.itemDetails);
}
