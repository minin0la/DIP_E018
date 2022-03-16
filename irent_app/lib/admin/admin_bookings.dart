import 'package:flutter/material.dart';
import 'package:irent_app/user_store_uroc.dart';
import 'dart:ui';
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFBFBFF),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Text('Order Date', style: dateStyle),
                  _dropDown(period: start),
                  Text('to', style: dateStyle),
                  _dropDown(period: end)
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: ListView.builder(
                  itemCount: bookingsData.length,
                  itemBuilder: (context, index) {
                    for (var product in bookingsData) {
                      return _bookingsCard(
                          context: context,
                          index: index,
                          itemName: bookingsData[index]['name'].toString(),
                          qty: int.parse(bookingsData[index]['qty'].toString()),
                          price: int.parse(
                              bookingsData[index]['price'].toString()),
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
        ],
      ),
    );
  }

  Widget _dropDown({required DateTime period}) {
    final TextStyle dateStyle = TextStyle(
        fontFamily: 'SF_Pro_Rounded',
        fontSize: 13,
        color: oxford,
        fontWeight: FontWeight.w300);

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        width: 115,
        height: 30,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: ElevatedButton(
          onPressed: pickDateRange,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Text(
                  DateFormat('dd/MM/yyyy').format(period),
                  style: dateStyle,
                ),
              ),
              Expanded(
                  flex: 1,
                  child: const Icon(
                    Icons.arrow_drop_down_sharp,
                    color: Color(0xFF001D4A),
                  ))
            ],
          ),
          style: ElevatedButton.styleFrom(primary: iceberg),
        ),
      ),
    );
  }

  Future<void> setBookingDate() async {
    try {
      users.update({'startdate': bookingStartDate, 'endDate': bookingEndDate});
    } catch (e) {
      print('an error has occured!');
    }
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: dateRange,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (newDateRange == null) return;
    setState(() => dateRange = newDateRange);
  }

  Widget _bookingsCard(
      {required BuildContext context,
      required int index,
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
              MaterialPageRoute(builder: (context) => BookingDetailsPage()),
            );
          },
        ),
        Divider(thickness: 1, indent: 15, endIndent: 15, color: iceberg),
      ],
    );
  }
}
