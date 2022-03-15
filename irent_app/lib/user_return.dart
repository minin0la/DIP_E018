import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:irent_app/app_icons.dart';
import 'package:irent_app/date.dart';
import 'package:irent_app/icrement_decrement.dart';
import 'package:irent_app/switch_nav.dart';
import 'package:irent_app/time.dart';
import 'package:irent_app/user_notcollect.dart';
import 'homepage.dart';
import 'constants.dart';
import 'package:irent_app/switch_nav.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class user_return extends StatefulWidget {
  const user_return({Key? key}) : super(key: key);

  @override
  State<user_return> createState() => _user_returnState();
}

class _user_returnState extends State<user_return> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Color white = const Color(0xFFFBFBFF);
  final Color oxford = const Color(0xFF001D4A);
  final Color aliceblue = const Color(0xFF81A4CD);
  final Color iceberg = const Color(0xFFDBE4EE);
  final Color marigold = const Color(0xFFECA400);
  final Color transparent = const Color(0x4DE3E3E3);

  bool? _success;
  String? _userEmail;

  int _itemCount = 0;
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
            'Confirmed Bookings',
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
                itemCount: historyData.length,
                itemBuilder: (context, index) {
                  for (var product in historyData) {
                    return _historyCard(
                        context: context,
                        itemName: historyData[index]['name'].toString(),
                        qty: int.parse(historyData[index]['qty'].toString()),
                        price:
                            int.parse(historyData[index]['price'].toString()),
                        collectDate:
                            historyData[index]['collectDate'].toString(),
                        returnDate: historyData[index]['returnDate'].toString(),
                        collectTime:
                            historyData[index]['collectTime'].toString(),
                        returnTime: historyData[index]['returnTime'].toString(),
                        ticketNumber: int.parse(
                            historyData[index]['ticketNumber'].toString()),
                        displayPicture:
                            historyData[index]['displayPicture'].toString());
                  }
                  throw 'No Data Found';
                }),
          ),
        ),
      ]),
    );
  }
}

Widget _historyCard(
    {required BuildContext context,
    required String itemName,
    required int qty,
    required int price,
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
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const user_notcollect()),
        );
      },
      child: Card(
        color: Color(0xFF81A4CD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 1,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10.0, right: 10, top: 15, bottom: 15),
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
                      Text('Qty: $qty   |   Price: \$$price',
                          style: subtitleStyles),
                      Text('Date: $collectDate - $returnDate',
                          style: subtitleStyles),
                      Text('Collection Time: $collectTime',
                          style: subtitleStyles),
                      Text('Return Time: $returnTime', style: subtitleStyles),
                      Row(
                        children: <Widget>[increment_decrement()],
                      ),
                      Row(
                        children: [
                          //
                          Column(
                            children: <Widget>[time()],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
