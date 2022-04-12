import 'package:flutter/material.dart';
import 'package:irent_app/user_store_uroc.dart';
import 'dart:ui' as ui;
import '../app_icons.dart';
import '../datetimetest.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'admin_constants.dart';
import 'admin_bookings_detail.dart';

class admin_bookings extends StatefulWidget {
  const admin_bookings({Key? key}) : super(key: key);

  @override
  _admin_bookingsState createState() => _admin_bookingsState();
}

class _admin_bookingsState extends State<admin_bookings> {
  final Color white = const Color(0xFFFBFBFF);
  final Color oxford = const Color(0xFF001D4A);
  final Color aliceblue = const Color(0xFF81A4CD);
  final Color iceberg = const Color(0xFFDBE4EE);
  final Color marigold = const Color(0xFFECA400);
  final Color transparent = const Color(0x4DE3E3E3);

  final TextStyle dateStyle = const TextStyle(
      color: Color(0xFF001D4A),
      fontFamily: 'SF_Pro_Rounded',
      fontSize: 15,
      fontWeight: FontWeight.w600);

  DocumentReference users =
      FirebaseFirestore.instance.collection('users').doc(uid);

  // final List<BookingsDataModel> bookings = List.generate(
  //     bookingsData.length,
  //     (index) => BookingsDataModel(
  //           '${bookingsData[index]['user']}',
  //           '${bookingsData[index]['name']}',
  //           '${bookingsData[index]['qty']}',
  //           '${bookingsData[index]['price']}',
  //           '${bookingsData[index]['collectDate']}',
  //           '${bookingsData[index]['returnDate']}',
  //           '${bookingsData[index]['collectTime']}',
  //           '${bookingsData[index]['returnTime']}',
  //           '${bookingsData[index]['ticketNumber']}',
  //           '${bookingsData[index]['displayPicture']}',
  //           '${bookingsData[index]['itemLoc']}',
  //           '${bookingsData[index]['returned']}',
  //           '${bookingsData[index]['imgCapture']}',
  //         ));

  DateTime dateTime = DateTime.now();
  ValueNotifier<DateTime> _dateTimeNotifier =
      ValueNotifier<DateTime>(DateTime.now());

  List transactionData = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getTransaction();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Container(
      color: Color(0xFFFBFBFF),
      child: Column(
        children: [
          Container(
            width: screenwidth * 0.95,
            height: 50,
            child: Row(
              children: [
                Text('Order Date', style: dateStyle),
                _beginDate(
                    context: context, dateTimeNotifier: _dateTimeNotifier),
                Text('to', style: dateStyle),
                _endDate(context: context, dateTimeNotifier: _dateTimeNotifier)
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: ListView.builder(
                  itemCount: transactionData.length,
                  itemBuilder: (context, index) {
                    // for (var product in bookingsData) {
                    return _bookingsCard(
                        context: context,
                        index: index,
                        itemName: transactionData[index].name,
                        qty: transactionData[index].qty,
                        price: transactionData[index].price,
                        collectDate: transactionData[index].collectDate,
                        returnDate: transactionData[index].returnDate,
                        collectTime: transactionData[index].collectTime,
                        returnTime: transactionData[index].returnTime,
                        ticketNumber: transactionData[index].ticketNumber,
                        displayPicture: transactionData[index].displayPicture);
                    // }
                    // throw 'No Data Found';
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _beginDate(
      {required BuildContext context,
      required ValueNotifier<DateTime> dateTimeNotifier}) {
    final TextStyle dateStyle = TextStyle(
        fontFamily: 'SF_Pro_Rounded',
        fontSize: 13,
        color: oxford,
        fontWeight: FontWeight.w300);

    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Directionality(
        textDirection: ui.TextDirection.rtl,
        child: Container(
          width: 125,
          height: 30,
          child: ElevatedButton.icon(
            onPressed: () async {
              DateTime? newStartDate = await showDatePicker(
                  context: context,
                  initialDate: _dateTimeNotifier.value,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2300));
              if (newStartDate != null) {
                setState(() {
                  dateTime = newStartDate;
                });
              }
            },
            icon: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: oxford,
            ),
            label: Text('${dateTime.day}/${dateTime.month}/${dateTime.year}',
                textAlign: TextAlign.start, style: dateStyle),
            style: ElevatedButton.styleFrom(
              primary: iceberg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _endDate(
      {required BuildContext context,
      required ValueNotifier<DateTime> dateTimeNotifier}) {
    final TextStyle dateStyle = TextStyle(
        fontFamily: 'SF_Pro_Rounded',
        fontSize: 13,
        color: oxford,
        fontWeight: FontWeight.w300);

    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Directionality(
        textDirection: ui.TextDirection.rtl,
        child: Container(
          width: 125,
          height: 30,
          child: ElevatedButton.icon(
            onPressed: () async {
              DateTime? newEndDate = await showDatePicker(
                  context: context,
                  initialDate: _dateTimeNotifier.value,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2300));
              if (newEndDate != null) {
                setState(() {
                  dateTime = newEndDate;
                });
              }
            },
            icon: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: oxford,
            ),
            label: Text('${dateTime.day}/${dateTime.month}/${dateTime.year}',
                textAlign: TextAlign.start, style: dateStyle),
            style: ElevatedButton.styleFrom(
              primary: iceberg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _bookingsCard(
      {required BuildContext context,
      required int index,
      required String itemName,
      required int qty,
      required num price,
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
            color: Color(0xFFFBFBFF),
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
                  builder: (context) => BookingDetailsPage(
                      bookingsDataModel: transactionData[index]),
                ));
          },
        ),
        Divider(thickness: 1, indent: 15, endIndent: 15, color: iceberg),
      ],
    );
  }

  getTransaction() {
    FirebaseFirestore.instance
        .collection('transactions')
        .snapshots()
        .listen((data) {
      setState(() {
        transactionData = List.from(
            data.docs.map((doc) => BookingsDataModel.fromSnapshot(doc)));
        // storeData = newstores;
      });
    });
  }
}

class BookingsDataModel {
  String user = "",
      name = "",
      displayPicture = "",
      status = "",
      itemLoc = "",
      returned = "",
      imgCapture = "";
  int qty = 0, price = 0, ticketNumber = 0;
  Timestamp collectDate = Timestamp.now(),
      returnDate = Timestamp.now(),
      collectTime = Timestamp.now(),
      returnTime = Timestamp.now();

  BookingsDataModel();
  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "qty": qty,
        "price": price,
        "collectDate": collectDate,
        "returnDate": returnDate,
        "collectTime": collectTime,
        "returnTime": returnTime,
        "ticketNumber": ticketNumber,
        "displayPicture": displayPicture,
        "status": status,
        "imgCapture": imgCapture,
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
        status = snapshot.data()['status'],
        imgCapture = "images/overcooked_cd.jpeg",
        displayPicture = snapshot.data()['displayPicture'];
}
