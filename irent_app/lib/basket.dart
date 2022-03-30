import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:irent_app/checkbox.dart';
import 'package:irent_app/date.dart';
import 'package:irent_app/user_payment.dart';
import 'increment_decrement.dart';

import 'package:irent_app/time.dart';

import 'constants.dart';

class basket extends StatefulWidget {
  final product_displayPicture;
  final product_name;
  final product_category;
  final product_price;
  var product_count;
  var product_starttime;
  var product_endtime;
  var product_startdate;
  var product_enddate;
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

  //DateTime dateTimestart = DateTime.now();

  DateTime dateTimeend = DateTime.now();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
          Expanded(
            flex: 6,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: ListView.builder(
                  itemCount: bookingsData.length,
                  itemBuilder: (context, index) {
                    for (var product in bookingsData) {
                      return _historyCard(
                          context: context,
                          itemName: bookingsData[index]['name'].toString(),
                          qty: int.parse(bookingsData[index]['qty'].toString()),
                          pricePerhour: int.parse(
                              bookingsData[index]['pricePerhour'].toString()),
                          collectDate:
                              bookingsData[index]['collectDate'].toString(),
                          returnDate:
                              bookingsData[index]['returnDate'].toString(),
                          collectTime:
                              bookingsData[index]['collectTime'].toString(),
                          returnTime:
                              bookingsData[index]['returnTime'].toString(),
                          ticketNumber: int.parse(
                              bookingsData[index]['ticketNumber'].toString()),
                          displayPicture:
                              bookingsData[index]['displayPicture'].toString());
                    }
                    throw 'No Data Found';
                  }),
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
                                  '2',
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
                                      builder: (context) => user_payment()));
                            },
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          )
        ]));
  }
}

Widget _historyCard(
    {required BuildContext context,
    required String itemName,
    required int qty,
    required int pricePerhour,
    required String collectDate,
    required String returnDate,
    required String collectTime,
    required String returnTime,
    required int ticketNumber,
    required String displayPicture}) {
  final TextStyle subtitleStyles = TextStyle(
    fontFamily: 'SF_Pro_Rounded',
    fontSize: 15,
    fontWeight: FontWeight.w300,
    color: Color(0xFF001D4A),
    wordSpacing: 1,
  );
  int _itemCount = 0;
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: GestureDetector(
      onTap: () {},
      child: Card(
        color: Color(0xFF81A4CD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 1,
        child: Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10, top: 15, bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: ListTile(
                    leading: Image.asset(
                      displayPicture,
                      height: 48,
                      width: 48,
                    ),
                    title: Text(
                      itemName,
                      style: TextStyle(
                        fontFamily: 'SF_Pro_Rounded',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF001D4A),
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('\$$pricePerhour / hour', style: subtitleStyles),
                        Text('Start Date             End Date',
                            style: subtitleStyles),
                        Row(
                          children: [Container(child: date())],
                        ),
                        Text('Start Time             End Time',
                            style: subtitleStyles),
                        Row(
                          children: [Container(child: time())],
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
                                        // setState(() {
                                        //   count--;
                                        // }
                                        //);
                                      },
                                      child: Icon(Icons.remove,
                                          color: Color.fromRGBO(0, 29, 74, 1),
                                          size: 20)),
                                ),
                                SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Text(
                                      '$qty',
                                      textAlign: TextAlign.center,
                                    )),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(219, 228, 238, 1),
                                      shape: BoxShape.circle),
                                  child: InkWell(
                                    onTap: () {
                                      // setState(() {
                                      //   count++;
                                      // });
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
                  ),
                ),
              ],
            )),
      ),
    ),
  );
}
