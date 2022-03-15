import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:irent_app/app_icons.dart';
import 'package:irent_app/switch_nav.dart';
import 'package:irent_app/user_store_uroc.dart';

import 'constants.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class user_home extends StatefulWidget {
  const user_home({Key? key}) : super(key: key);

  @override
  State<user_home> createState() => _user_homeState();
}

class _user_homeState extends State<user_home> {
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
            'Stores',
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
                itemCount: stores.length,
                itemBuilder: (context, index) {
                  for (var product in stores) {
                    return _storeCard(
                        context: context,
                        store_name: stores[index]['store_name'].toString(),
                        address: stores[index]['address'].toString(),
                        category: stores[index]['category'].toString(),
                        displayStorePicture:
                            stores[index]['displayStorePicture'].toString());
                  }
                  throw 'No Data Found';
                }),
          ),
        ),
      ]),
    );
  }
}

Widget _storeCard(
    {required BuildContext context,
    required String store_name,
    required String address,
    required String category,
    required String displayStorePicture}) {
  final TextStyle subtitleStyles = TextStyle(
    fontFamily: 'SF_Pro_Rounded',
    fontSize: 15,
    fontWeight: FontWeight.w300,
    color: Color(0xFFFBFBFF),
    wordSpacing: 1,
  );

  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const user_store_uroc()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: new DecorationImage(
            image: AssetImage(displayStorePicture),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(0, 29, 74, 0.6000000238418579),
          ),
          child: Card(
            color: Colors.transparent, //Colors.white70.withOpacity(0.45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10, top: 15, bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
                    child: ListTile(
                      title: Text(
                        store_name,
                        style: TextStyle(
                          fontFamily: 'SF_Pro_Rounded',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFBFBFF),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(""),
                          Text('$address', style: subtitleStyles),
                          Text(""),
                          Text('Category: $category', style: subtitleStyles)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
