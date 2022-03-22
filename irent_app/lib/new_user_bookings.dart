import 'package:flutter/material.dart';
import 'package:irent_app/models/booking_models.dart';
import 'package:irent_app/user_notcollect.dart';

class new_user_bookings extends StatefulWidget {
  const new_user_bookings({Key? key}) : super(key: key);

  @override
  _new_user_bookingsState createState() => _new_user_bookingsState();
}

class _new_user_bookingsState extends State<new_user_bookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Container(
                  height: 45,
                  width: 248,
                  margin: EdgeInsets.only(left: 45, top: 10),
                  child: Text(
                    'Confirmed Bookings',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(0, 29, 74, 1),
                        fontFamily: 'SF Pro Rounded',
                        fontSize: 25,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w600,
                        height: 1),
                  )),
            ],
          ),
          Flexible(
              child: ListView.builder(
                  itemCount: Booking.bookings.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BookingWidgetsCard(index: index);
                  })),
        ],
      ),
    );
  }
}

class BookingWidgetsCard extends StatelessWidget {
  final int index;

  BookingWidgetsCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int collectionInt = Booking.bookings[index].collectionTime;
    DateTime collectiontsdate =
        DateTime.fromMillisecondsSinceEpoch(collectionInt * 1000);
    String collectionDate = collectiontsdate.day.toString() +
        "/" +
        collectiontsdate.month.toString() +
        "/" +
        collectiontsdate.year.toString();
    String collectionTime = collectiontsdate.hour.toString() +
        ":" +
        collectiontsdate.minute.toString();
    int returnInt = Booking.bookings[index].returnTime;
    DateTime returntsdate =
        DateTime.fromMillisecondsSinceEpoch(returnInt * 1000);
    String returnDate = returntsdate.day.toString() +
        "/" +
        returntsdate.month.toString() +
        "/" +
        returntsdate.year.toString();
    String returnTime =
        returntsdate.hour.toString() + ":" + returntsdate.minute.toString();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => user_notcollect()));
            },
            child: Container(
                margin: EdgeInsets.only(top: 12.5),
                alignment: Alignment.bottomCenter,
                height: 141,
                width: 326,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(129, 164, 205, 1),
                ),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 30),
                        height: 48,
                        width: 48,
                        // color: Colors.black,
                        child: Image.network(Booking.bookings[index].imageUrl)),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 18,
                                width: 165,
                                margin: EdgeInsets.only(top: 20, left: 15),
                                child: Text(
                                  Booking.bookings[index].name,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 29, 74, 1),
                                      fontFamily: 'SF Pro Rounded',
                                      fontSize: 15,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                      height: 1),
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                height: 14,
                                width: 165,
                                margin: EdgeInsets.only(top: 5, left: 15),
                                child: Text(
                                  'Qty: ${Booking.bookings[index].qty}   |   Price: \$${Booking.bookings[index].price}',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 29, 74, 1),
                                      fontFamily: 'SF Pro Rounded',
                                      fontSize: 12,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                height: 14,
                                width: 168,
                                margin: EdgeInsets.only(top: 5, left: 15),
                                child: Text(
                                  'Date: $collectionDate - $returnDate',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 29, 74, 1),
                                      fontFamily: 'SF Pro Rounded',
                                      fontSize: 12,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                height: 14,
                                width: 165,
                                margin: EdgeInsets.only(top: 5, left: 15),
                                child: Text(
                                  'Collection Time: $collectionTime',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 29, 74, 1),
                                      fontFamily: 'SF Pro Rounded',
                                      fontSize: 12,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                height: 14,
                                width: 165,
                                margin: EdgeInsets.only(top: 5, left: 15),
                                child: Text(
                                  'Return Time: $returnTime',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 29, 74, 1),
                                      fontFamily: 'SF Pro Rounded',
                                      fontSize: 12,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ))
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 20,
                                width: 30,
                                margin: EdgeInsets.only(top: 20, left: 15),
                                child: Text(
                                  '# 99',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 29, 74, 1),
                                      fontFamily: 'SF Pro Rounded',
                                      fontSize: 15,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              margin: EdgeInsets.only(top: 20, left: 15),
                              child: Icon(Icons.arrow_forward_ios_outlined),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
