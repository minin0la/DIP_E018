import 'package:flutter/material.dart';
//import '../size_config.dart';
import 'constants.dart';
import 'user_bookings.dart';

class user_payment extends StatefulWidget {
  final product_displayPicture;
  final product_name;
  final product_category;
  final product_price;
  final product_count;
  final product_starttime;
  final product_endtime;
  final product_startdate;
  final product_enddate;
  user_payment(
      {this.product_displayPicture,
      this.product_name,
      this.product_category,
      this.product_price,
      this.product_count,
      this.product_enddate,
      this.product_endtime,
      this.product_startdate,
      this.product_starttime});

  @override
  _user_paymentState createState() => _user_paymentState();
}

class _user_paymentState extends State<user_payment> {
  final Color white = const Color(0xFFFBFBFF);
  final Color oxford = const Color(0xFF001D4A);
  final Color aliceblue = const Color(0xFF81A4CD);
  final Color iceberg = const Color(0xFFDBE4EE);
  final Color marigold = const Color(0xFFECA400);
  final Color transparent = const Color(0x4DE3E3E3);
  TextEditingController total = TextEditingController();

  bool? _success;
  String? _userEmail;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Payment',
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
                        // price:
                        //     int.parse(bookingsData[index]['price'].toString()),
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
                //margin: EdgeInsets.only(top: 201.5),
                alignment: Alignment.bottomCenter,
                height: 100,
                width: 412,
                color: Color(0xFF001D4A),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      height: 80,
                      width: 80,
                      child: Column(
                        children: [
                          Container(
                              height: 30,
                              width: 130,
                              child: Text(
                                'Total:',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(251, 251, 255, 1),
                                    fontFamily: 'SF Pro Rounded',
                                    fontSize: 16,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                          Container(
                              height: 30,
                              width: 150,
                              child: Text(
                                '\$10',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(251, 251, 255, 1),
                                    fontFamily: 'SF Pro Rounded',
                                    fontSize: 30,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            showAlertDialog(context);
                          },
                          child: Container(
                              margin: EdgeInsets.only(left: 100, top: 22),
                              height: 53,
                              width: 168,
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
                                'Confirm',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'SF Pro Rounded',
                                    fontSize: 18,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ]),
    );
  }
}

Widget _historyCard(
    {required BuildContext context,
    required String itemName,
    required int qty,
    // required int price,
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

  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: GestureDetector(
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
                      Text('\$$pricePerhour /hour', style: subtitleStyles),
                      Row(
                        children: [
                          Container(
                            height: 17,
                            width: 80,
                            child: Text(
                              'Date: ',
                              style: TextStyle(
                                fontFamily: 'SF_Pro_Rounded',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF001D4A),
                              ),
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 17,
                                width: 135,
                                decoration: BoxDecoration(
                                    color: Color(0xFFDBE4EE),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 17,
                                width: 135,
                                child: Center(
                                  child: Text(
                                    '$collectDate - $returnDate',
                                    style: TextStyle(
                                      fontFamily: 'SF_Pro_Rounded',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF001D4A),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 17,
                            width: 80,
                            child: Text(
                              'Start Time: ',
                              style: TextStyle(
                                fontFamily: 'SF_Pro_Rounded',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF001D4A),
                              ),
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 17,
                                width: 135,
                                decoration: BoxDecoration(
                                    color: Color(0xFFDBE4EE),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 17,
                                width: 135,
                                child: Center(
                                  child: Text(
                                    '$collectTime',
                                    style: TextStyle(
                                      fontFamily: 'SF_Pro_Rounded',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF001D4A),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 17,
                            width: 80,
                            child: Text(
                              'End Time: ',
                              style: TextStyle(
                                fontFamily: 'SF_Pro_Rounded',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF001D4A),
                              ),
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 17,
                                width: 135,
                                decoration: BoxDecoration(
                                    color: Color(0xFFDBE4EE),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 17,
                                width: 135,
                                child: Center(
                                  child: Text(
                                    '$returnTime',
                                    style: TextStyle(
                                      fontFamily: 'SF_Pro_Rounded',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF001D4A),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 17,
                            width: 80,
                            child: Text(
                              'Quantity: ',
                              style: TextStyle(
                                fontFamily: 'SF_Pro_Rounded',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF001D4A),
                              ),
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: 17,
                                width: 135,
                                decoration: BoxDecoration(
                                    color: Color(0xFFDBE4EE),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 17,
                                width: 135,
                                child: Center(
                                  child: Text(
                                    '$qty',
                                    style: TextStyle(
                                      fontFamily: 'SF_Pro_Rounded',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF001D4A),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
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

showAlertDialog(BuildContext context) {
  // set up the buttons
  shape:
  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0));
  color:
  Color(0xFFDBE4EE);
  Widget okButton = ElevatedButton(
    style: ElevatedButton.styleFrom(
        primary: const Color(0xFF001D4A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(38))),
    child: Text(
      "OK",
      style: TextStyle(
          color: Color(0xFFFBFBFF),
          fontFamily: 'SF_Pro_Rounded',
          fontSize: 18,
          fontWeight: FontWeight.w700),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    backgroundColor: Color(0xFFDBE4EE),
    title: Text("Insufficient Balance"),
    content: Text("Please top-up your iRent walet to make this booking."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
