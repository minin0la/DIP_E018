import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:irent_app/collect_barcode.dart';
import 'extend.dart';
import 'package:irent_app/constants.dart';
import 'package:irent_app/user_notcollect.dart';
import 'bookings_details.dart';
import 'app_icons.dart';
import 'homepage.dart';
import 'package:irent_app/switch_nav.dart';
import 'user_qr_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class user_bookings extends StatefulWidget {
  const user_bookings({Key? key}) : super(key: key);

  @override
  State<user_bookings> createState() => _user_bookingsState();
}

class _user_bookingsState extends State<user_bookings> {
  final Color white = const Color(0xFFFBFBFF);
  final Color oxford = const Color(0xFF001D4A);
  final Color aliceblue = const Color(0xFF81A4CD);
  final Color iceberg = const Color(0xFFDBE4EE);
  final Color marigold = const Color(0xFFECA400);
  final Color transparent = const Color(0x4DE3E3E3);

  final List<BookingsDataModel> bookings = List.generate(
      bookingsData.length,
      (index) => BookingsDataModel(
            '${bookingsData[index]['name']}',
            '${bookingsData[index]['qty']}',
            '${bookingsData[index]['price']}',
            '${bookingsData[index]['collectDate']}',
            '${bookingsData[index]['returnDate']}',
            '${bookingsData[index]['collectTime']}',
            '${bookingsData[index]['returnTime']}',
            '${bookingsData[index]['ticketNumber']}',
            '${bookingsData[index]['displayPicture']}',
          ));

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size.width;
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
                itemCount: bookingsData.length,
                itemBuilder: (context, index) {
                  for (var product in bookingsData) {
                    return _bookingsCard(
                        context: context,
                        index: index,
                        name: bookings[index].name,
                        qty: int.parse(bookings[index].qty),
                        price: num.parse(bookings[index].price),
                        collectDate: bookings[index].collectDate,
                        returnDate: bookings[index].returnDate,
                        collectTime: bookings[index].collectTime,
                        returnTime: bookings[index].returnTime,
                        ticketNumber: int.parse(bookings[index].ticketNumber),
                        displayPicture: bookings[index].displayPicture);
                  }
                  throw 'No Data Found';
                }),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
          child: Text(
            'Ongoing Bookings',
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
                    return _bookingsOngoingCard(
                        context: context,
                        index: index,
                        name: bookings[index].name,
                        qty: int.parse(bookings[index].qty),
                        price: num.parse(bookings[index].price),
                        collectDate: bookings[index].collectDate,
                        returnDate: bookings[index].returnDate,
                        collectTime: bookings[index].collectTime,
                        returnTime: bookings[index].returnTime,
                        ticketNumber: int.parse(bookings[index].ticketNumber),
                        displayPicture: bookings[index].displayPicture);
                  }
                  throw 'No Data Found';
                }),
          ),
        ),
      ]),
    );
  }

  Widget _bookingsCard(
      {required BuildContext context,
      required int index,
      required String name,
      required int qty,
      required num price,
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

    return Column(
      children: [
        InkWell(
          child: Card(
            color: Color(0xFF81A4CD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10, top: 5, bottom: 5),
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
                        name,
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
                          Text('Return Time: $returnTime',
                              style: subtitleStyles),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text('#$ticketNumber', style: subtitleStyles),
                        SizedBox(
                          height: 25,
                        ),
                        Icon(AppIcons.arrowforward, size: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        collect_barcode())); //time for collection => collect_barcode()
          },
        ),
      ],
    );
  }

  Widget _bookingsOngoingCard(
      {required BuildContext context,
      required int index,
      required String name,
      required int qty,
      required num price,
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

    return Column(
      children: [
        InkWell(
          child: Card(
            color: Color(0xFF81A4CD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10, top: 5, bottom: 5),
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
                        name,
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
                          Text('Return Time: $returnTime',
                              style: subtitleStyles),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text('#$ticketNumber', style: subtitleStyles),
                        SizedBox(
                          height: 25,
                        ),
                        Icon(AppIcons.arrowforward, size: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      bookings_details(bookingsDataModel: bookings[index]),
                ));
          },
        ),
      ],
    );
  }
}

class BookingsDataModel {
  final String name,
      qty,
      price,
      collectDate,
      returnDate,
      collectTime,
      returnTime,
      ticketNumber,
      displayPicture;

  BookingsDataModel(
    this.name,
    this.qty,
    this.price,
    this.collectDate,
    this.returnDate,
    this.collectTime,
    this.returnTime,
    this.ticketNumber,
    this.displayPicture,
  );
}
