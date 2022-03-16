// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:irent_app/app_icons.dart';
import 'package:irent_app/switch_nav.dart';
import 'homepage.dart';
import 'constants.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class HistoryDetailsPage extends StatefulWidget {
  const HistoryDetailsPage({Key? key}) : super(key: key);

  @override
  State<HistoryDetailsPage> createState() => _HistoryDetailsPageState();
}

class _HistoryDetailsPageState extends State<HistoryDetailsPage> {
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      body: Column(children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
                color: aliceblue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                )),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'images/cross-bg-cropped-2.png',
                  ),
                ),
                Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    centerTitle: true,
                    title: Text(
                      'History',
                      style: TextStyle(
                          color: oxford,
                          fontFamily: 'SF_Pro_Rounded',
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    elevation: 0,
                    leading: Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            size: 32,
                            color: oxford,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 30),
            child: ListView.builder(
                itemCount: historyDetailsTest.length,
                itemBuilder: (context, index) {
                  for (var product in historyData) {
                    return _historyDetails(
                        itemName: historyDetailsTest[index]['name'].toString(),
                        qty: int.parse(
                            historyDetailsTest[index]['qty'].toString()),
                        price: int.parse(
                            historyDetailsTest[index]['price'].toString()),
                        collected:
                            historyDetailsTest[index]['collectDate'].toString(),
                        returned:
                            historyDetailsTest[index]['returnDate'].toString(),
                        ticketNumber: int.parse(historyDetailsTest[index]
                                ['ticketNumber']
                            .toString()),
                        displayPicture: historyDetailsTest[index]
                                ['displayPicture']
                            .toString());
                  }
                  throw 'No Data Found';
                }),
          ),
        ),
      ]),
    );
  }
}

Widget _fields({
  required String title,
  required String subtitle,
  required double width,
}) {
  final TextStyle titleStyles = TextStyle(
    fontFamily: 'SF_Pro_Rounded',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Color(0xFF001D4A),
    wordSpacing: 1,
  );
  final TextStyle subtitleStyles = TextStyle(
    fontFamily: 'SF_Pro_Rounded',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Color(0xFF001D4A),
    wordSpacing: 1,
  );
  final Color dividerColor = Color(0x8081A4CD);

  return Padding(
    padding: const EdgeInsets.only(top: 30.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: titleStyles),
        Divider(
          height: 15,
          thickness: 1,
          endIndent: 25,
          color: dividerColor,
        ),
        Text(subtitle, style: subtitleStyles),
      ],
    ),
  );
}

Widget _historyDetails(
    {required String itemName,
    required int qty,
    required int price,
    required String collected,
    required String returned,
    required int ticketNumber,
    required String displayPicture}) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(flex: 1, child: Image.asset(displayPicture)),
          Expanded(
            flex: 3,
            child: Text(
              itemName,
              style: TextStyle(
                fontFamily: 'SF_Pro_Rounded',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF001D4A),
                wordSpacing: 1,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      _fields(
          title: 'Booking Reference',
          subtitle: '#$ticketNumber',
          width: double.infinity),
      Row(
        children: [
          Expanded(
            flex: 1,
            child: _fields(
                title: 'Collected at',
                subtitle: collected,
                width: double.infinity),
          ),
          Expanded(
            flex: 1,
            child: _fields(
                title: 'Return at', subtitle: returned, width: double.infinity),
          ),
        ],
      )
    ],
  );
}
