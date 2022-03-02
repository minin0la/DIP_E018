import 'package:flutter/material.dart';
import 'package:irent_app/user_payment_mario.dart';
import 'package:irent_app/user_payment_overcooked.dart';
import '../size_config.dart';

class user_payment extends StatefulWidget {
  const user_payment({Key? key}) : super(key: key);

  @override
  _user_paymentState createState() => _user_paymentState();
}

class _user_paymentState extends State<user_payment> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Payment',
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
        body: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  user_payment_mario(),
                  SizedBox(
                    height: getProportionateScreenWidth(20),
                  ),
                  user_payment_overcooked(),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 201.5),
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
                              onTap: () {},
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
          ],
        ));
  }
}
