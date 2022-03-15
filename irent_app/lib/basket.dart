import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:irent_app/app_icons.dart';
import 'package:irent_app/checkbox.dart';
import 'package:irent_app/date.dart';
import 'package:irent_app/icrement_decrement.dart';
import 'package:irent_app/switch_nav.dart';
import 'package:irent_app/time.dart';
import 'homepage.dart';
import 'constants.dart';
import 'user_payment.dart';
import 'package:irent_app/switch_nav.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class basket extends StatefulWidget {
  const basket({Key? key}) : super(key: key);

  @override
  State<basket> createState() => _basketState();
}

class _basketState extends State<basket> {
  final Color white = const Color(0xFFFBFBFF);
  final Color oxford = const Color(0xFF001D4A);
  final Color aliceblue = const Color(0xFF81A4CD);
  final Color iceberg = const Color(0xFFDBE4EE);
  final Color marigold = const Color(0xFFECA400);
  final Color transparent = const Color(0x4DE3E3E3);

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
            'Basket',
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
                itemCount: productDetails.length,
                itemBuilder: (context, index) {
                  for (var product in productDetails) {
                    return _productDetails(
                        context: context,
                        name: productDetails[index]['name'].toString(),
                        product_category: productDetails[index]
                                ['product_category']
                            .toString(),
                        pricePerhour: int.parse(
                            productDetails[index]['pricePerhour'].toString()),
                        displayPicture:
                            historyData[index]['displayPicture'].toString());
                  }
                  throw 'No Data Found';
                }),
          ),
        ),
        Column(
          children: [
            Container(
                margin: EdgeInsets.only(left: 20, top: 12.5),
                alignment: Alignment.bottomCenter,
                height: 100,
                width: 412,
                color: Color(0xFFFBFBFF),
                child: Row(
                  children: [
                    checkbox(),
                    Container(
                      child: Text('All'),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 100),
                      height: 58,
                      width: 67,
                      child: Column(
                        children: [
                          Container(
                              height: 21,
                              width: 126,
                              child: Text(
                                'Total',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xFF001D4A),
                                    fontFamily: 'SF Pro Rounded',
                                    fontSize: 16,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                    height: 1),
                              )),
                          Container(
                              height: 25,
                              width: 126,
                              child: Text(
                                '\$2',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xFF001D4A),
                                    fontFamily: 'SF Pro Rounded',
                                    fontSize: 30,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                    height: 1),
                              )),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        InkWell(
                          child: Container(
                              margin: EdgeInsets.only(top: 22),
                              height: 53,
                              width: 140,
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
                                'Book',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'SF Pro Rounded',
                                    fontSize: 18,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              )),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const user_payment()),
                            );
                          },
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

Widget _productDetails(
    {required BuildContext context,
    required String name,
    required String product_category,
    required int pricePerhour,
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
              child: (Column(
                children: [checkbox()],
              )),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: new DecorationImage(
                          image: AssetImage(displayPicture),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
              flex: 11,
              child: ListTile(
                title: Row(
                  children: [
                    Container(
                      width: 180,
                      child: Text(
                        name,
                        style: TextStyle(
                          fontFamily: 'SF_Pro_Rounded',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF001D4A),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                          onTap: () {
                            showAlertDialog(context);
                          },
                          child: Container(
                            child: Icon(Icons.close),
                          )),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$$pricePerhour /hour',
                      style: TextStyle(
                        fontFamily: 'SF_Pro_Rounded',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF001D4A),
                      ),
                    ),
                    Text('Start Date           End Date',
                        style: subtitleStyles),
                    Row(
                      children: [date()],
                    ),
                    Text('Start Time           End Time',
                        style: subtitleStyles),
                    Row(
                      children: [time()],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [increment_decrement()],
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
  );
}

showAlertDialog(BuildContext context) {
  // set up the buttons

  Widget noButton = TextButton(
    child: Text("No"),
    onPressed: () {},
  );
  Widget yesButton = TextButton(
    child: Text("Yes"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    //title: Text("Notice"),
    content: Text("Do you want to remove this?"),
    actions: [
      noButton,
      yesButton,
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
