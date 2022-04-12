import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:irent_app/collect_barcode.dart';
import 'package:irent_app/constants.dart';

import 'app_icons.dart';
import 'bookings_details.dart';

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
  List bookings = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getBooking();
  }

  // final List<BookingsDataModel> bookings = List.generate(
  //     bookingsData.length,
  //     (index) => BookingsDataModel(
  //           '${bookingsData[index]['name']}',
  //           '${bookingsData[index]['qty']}',
  //           '${bookingsData[index]['price']}',
  //           '${bookingsData[index]['collectDate']}',
  //           '${bookingsData[index]['returnDate']}',
  //           '${bookingsData[index]['collectTime']}',
  //           '${bookingsData[index]['returnTime']}',
  //           '${bookingsData[index]['ticketNumber']}',
  //           '${bookingsData[index]['displayPicture']}',
  //         ));

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
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  // for (var product in bookingsData) {
                  return _bookingsCard(
                      context: context,
                      index: index,
                      name: bookings[index].name,
                      qty: bookings[index].qty,
                      price: bookings[index].price,
                      collectDate: bookings[index].collectDate,
                      returnDate: bookings[index].returnDate,
                      collectTime: bookings[index].collectTime,
                      returnTime: bookings[index].returnTime,
                      ticketNumber: bookings[index].ticketNumber,
                      displayPicture: bookings[index].displayPicture);
                  // }
                  // throw 'No Data Found';
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
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  // for (var product in bookingsData) {
                  return _bookingsOngoingCard(
                      context: context,
                      index: index,
                      name: bookings[index].name,
                      qty: bookings[index].qty,
                      price: bookings[index].price,
                      collectDate: bookings[index].collectDate,
                      returnDate: bookings[index].returnDate,
                      collectTime: bookings[index].collectTime,
                      returnTime: bookings[index].returnTime,
                      ticketNumber: bookings[index].ticketNumber,
                      displayPicture: bookings[index].displayPicture);
                  // }
                  // throw 'No Data Found';
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
      required int price,
      required Timestamp collectDate,
      required Timestamp returnDate,
      required Timestamp collectTime,
      required Timestamp returnTime,
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
                      leading: Image.network(
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
                          Text(
                              'Date: ${DateFormat('dd/MM/yyyy').format(collectDate.toDate())} - ${DateFormat('dd/MM/yyyy').format(returnDate.toDate())}',
                              style: subtitleStyles),
                          Text(
                              'Collection Time: ${DateFormat('kk:mm:ss').format(collectTime.toDate())}',
                              style: subtitleStyles),
                          Text(
                              'Return Time: ${DateFormat('kk:mm:ss').format(returnTime.toDate())}',
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
      required int price,
      required Timestamp collectDate,
      required Timestamp returnDate,
      required Timestamp collectTime,
      required Timestamp returnTime,
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
                      leading: Image.network(
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
                          Text(
                              'Date: ${DateFormat('dd/MM/yyyy').format(collectDate.toDate())} - ${DateFormat('dd/MM/yyyy').format(returnDate.toDate())}',
                              style: subtitleStyles),
                          Text(
                              'Collection Time: ${DateFormat('kk:mm:ss').format(collectTime.toDate())}',
                              style: subtitleStyles),
                          Text(
                              'Return Time: ${DateFormat('kk:mm:ss').format(returnTime.toDate())}',
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

  getBooking() {
    FirebaseFirestore.instance
        .collection('transactions')
        .where("user", isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .snapshots()
        .listen((data) {
      setState(() {
        bookings = List.from(
            data.docs.map((doc) => BookingsDataModel.fromSnapshot(doc)));
        // storeData = newstores;
      });
    });
  }
}

class BookingsDataModel {
  String name = "", displayPicture = "";
  int qty = 0, price = 0, ticketNumber = 0;
  Timestamp collectDate = Timestamp.now(),
      returnDate = Timestamp.now(),
      collectTime = Timestamp.now(),
      returnTime = Timestamp.now();
  BookingsDataModel();
  Map<String, dynamic> toJson() => {
        "name": name,
        "qty": qty,
        "price": price,
        "collectDate": collectDate,
        "returnDate": returnDate,
        "collectTime": collectTime,
        "returnTime": returnTime,
        "ticketNumber": ticketNumber,
        "displayPicture": displayPicture,
      };
  BookingsDataModel.fromSnapshot(snapshot)
      : name = snapshot.data()['name'],
        qty = snapshot.data()['qty'],
        price = snapshot.data()['price'],
        collectDate = snapshot.data()['collectDate'],
        returnDate = snapshot.data()['returnDate'],
        collectTime = snapshot.data()['collectTime'],
        returnTime = snapshot.data()['returnTime'],
        ticketNumber = snapshot.data()['ticketNumber'],
        displayPicture = snapshot.data()['displayPicture'];
}
