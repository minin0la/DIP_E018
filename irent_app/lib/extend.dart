import 'package:flutter/material.dart';
import 'user_bookings.dart';

class extend extends StatefulWidget {
  final Color white = const Color(0xFFFBFBFF);
  final Color oxford = const Color(0xFF001D4A);
  final Color aliceblue = const Color(0xFF81A4CD);
  final Color iceberg = const Color(0xFFDBE4EE);
  final Color marigold = const Color(0xFFECA400);
  final Color transparent = const Color(0x4DE3E3E3);
  //final BookingsDataModel bookingsDataModel;
  const extend({Key? key}) : super(key: key);

  @override
  State<extend> createState() => _extendState();
}

class _extendState extends State<extend> {
  @override
  Widget build(BuildContext context) {
    var bookingsDataModel;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFBFBFF),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Extend',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(0, 29, 74, 1),
              fontFamily: 'SF_Pro_Rounded',
              fontSize: 25,
              fontWeight: FontWeight.w500),
        ),
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(children: [
        Divider(
          color: Colors.black,
        ),
        Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 30),
                // child: _bookingsDetails(
                //   itemName: bookingsDataModel.name,
                //   qty: int.parse(bookingsDataModel.qty),
                //   price: num.parse(bookingsDataModel.price),
                //   collectDate: bookingsDataModel.collectDate,
                //   returnDate: bookingsDataModel.returnDate,
                //   collectTime: bookingsDataModel.collectTime,
                //   returnTime: bookingsDataModel.returnTime,
                //   ticketNumber: int.parse(bookingsDataModel.ticketNumber),
                //   displayPicture: bookingsDataModel.displayPicture,
                // )
              ),
            )),
      ]),
    );
  }
}
