import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irent_app/user_item_page.dart';

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
                        child: Text(
                          '\$10.25',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(251, 251, 255, 1),
                            fontFamily: 'SF Pro Rounded',
                            fontSize: 25,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
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
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (itemWidth / itemHeight),
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20,
                children: _listItem
                    .map((item) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const user_item_page()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(item),
                                    fit: BoxFit.cover)),
                          ),
                        ))
                    .toList(),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
