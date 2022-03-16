// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:irent_app/app_icons.dart';
import 'package:irent_app/switch_nav.dart';
import 'homepage.dart';
import 'constants.dart';
import 'history_details.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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

  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HistoryDetailsPage()),
        );
      },
      child: Card(
        color: Color(0xFFDBE4EE),
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
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text('#$ticketNumber', style: subtitleStyles),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
