import 'dart:ui';
import 'package:irent_app/database.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irent_app/topup.dart';
import 'package:intl/intl.dart';
import 'package:irent_app/database.dart';
import 'package:irent_app/user_item_page.dart';

import 'constants.dart';

import 'constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';

import 'package:irent_app/CategoriesScroller.dart';

class user_store_uroc extends StatefulWidget {
  const user_store_uroc({Key? key}) : super(key: key);

  @override
  _user_store_urocState createState() => _user_store_urocState();
}

class _user_store_urocState extends State<user_store_uroc> {
  @override
  bool closeTopContainer = false;

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    final List<String> _listItem = [
      'images/Image_mariokartdeluxe.jpg',
      'images/Image_supermario.jfif',
      'images/Image_madden18.jpg',
      'images/Image_overcooked.jpg',
      'images/Image_fifa22.jpeg',
    ];

    final double itemHeight = 100;
    final double itemWidth = 120;
    var formatter = NumberFormat("#,##0.00", "en_US");

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'UROC',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(0, 29, 74, 1),
              fontFamily: 'SF_Pro_Rounded',
              fontSize: 25,
              fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 45.0),
              width: 330,
              height: 82,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset(0, 4),
                      blurRadius: 4)
                ],
                color: Color.fromRGBO(129, 164, 205, 1),
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 14.0, left: 22.0),
                        height: 21,
                        width: 126,
                        //color: Colors.blue,
                        child: Text.rich(TextSpan(children: [
                          WidgetSpan(
                              child: Icon(Icons
                                  .wallet_giftcard_outlined)), //change the wallet icon
                          TextSpan(
                              text: 'Wallet Balance',
                              style: TextStyle(
                                  color: Color.fromRGBO(251, 251, 255, 1),
                                  fontFamily: 'SF Pro Rounded',
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal)),
                        ])),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 6.0, left: 22.0),
                        height: 28.25,
                        width: 126,
                        //color: Colors.black,
                        child: FutureBuilder(
                          future: getUserInfo(),
                          builder: (BuildContext context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.hasData && snapshot.data!.exists) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                Map<String, dynamic> data = snapshot.data!
                                    .data() as Map<String, dynamic>;
                                return Text(
                                  "\$" + formatter.format(data['wallet']),
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromRGBO(251, 251, 255, 1),
                                    fontFamily: 'SF Pro Rounded',
                                    fontSize: 25,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                  ),
                                );
                              }
                            } else if (snapshot.hasError) {
                              return Text('no data');
                            }
                            return CircularProgressIndicator();
                          },
                        ),
                      )
                    ],
                  ),
                  InkWell(
                    child: Container(
                      width: 66,
                      height: 29,
                      margin: EdgeInsets.only(left: 90.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        color: Color.fromRGBO(39, 71, 110, 1),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Top Up',
                        style: TextStyle(
                          color: Color.fromRGBO(251, 251, 255, 1),
                          fontFamily: 'SF Pro Rounded',
                          fontSize: 12,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TopUpPage()),
                      );
                    },
                  )
                ],
              ),
            ),
            Container(
              width: 126,
              height: 35,
              margin: EdgeInsets.only(left: 45.0, top: 10.0),
              child: Text(
                'Categories',
                style: TextStyle(
                    color: Color.fromRGBO(0, 29, 74, 1),
                    fontFamily: 'SF Pro Rounded',
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            ),
            CategoriesScroller(),
            Expanded(
              flex: 6,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      for (var product in products) {
                        return _productDetailsCard(
                            context: context,
                            name: productDetails[index]['name'].toString(),
                            product_category: productDetails[index]
                                    ['product_category']
                                .toString(),
                            pricePerhour: int.parse(productDetails[index]
                                    ['pricePerhour']
                                .toString()),
                            displayPicture: productDetails[index]
                                    ['displayPicture']
                                .toString());
                      }
                      throw 'No Data Found';
                    }),
              ),
            ),
            InkWell(
              child: Expanded(
                flex: 6,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: productDetails.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        for (var product in productDetails) {
                          return _productDetailsCard(
                              context: context,
                              name: productDetails[index]['name'].toString(),
                              product_category: productDetails[index]
                                      ['product_category']
                                  .toString(),
                              pricePerhour: int.parse(productDetails[index]
                                      ['pricePerhour']
                                  .toString()),
                              displayPicture: productDetails[index]
                                      ['displayPicture']
                                  .toString());
                        }
                        throw 'No Data Found';
                      }),
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

Widget _productDetailsCard(
    {required BuildContext context,
    required String name,
    required String product_category,
    required int pricePerhour,
    required String displayPicture}) {
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => user_item_page()),
            );
          },
          child: Container(
              height: 250,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: new DecorationImage(
                    image: AssetImage(displayPicture),
                    fit: BoxFit.cover,
                  ),
                ),
              ))));
}
