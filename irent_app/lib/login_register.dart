// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'login.dart';
import 'signup_page.dart';
import 'dart:ui';

class LoginRegisterScreen extends StatelessWidget {
  final Color white = const Color(0xFFFBFBFF);
  final Color oxford = const Color(0xFF001D4A);
  final Color aliceblue = const Color(0xFF81A4CD);
  final Color marigold = const Color(0xFFECA400);
  final Color transparent = const Color(0x4DE3E3E3);
  const LoginRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: aliceblue,
      body: Stack(
        children: [
          Image.asset(
            'images/cross_bg.png',
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Image.asset(
                    'images/irent-logo.png',
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.35),
              Image.asset(
                'images/hand.png',
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.25),
              Center(
                child: Image.asset(
                  'images/board-game.png',
                  width: MediaQuery.of(context).size.width * 0.65,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 50, bottom: 100),
                  width: screenwidth,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        SizedBox(
                          height: 125,
                        ),
                        const Text(
                          'iRent',
                          style: TextStyle(
                              color: Color(0xFFFBFBFF),
                              fontSize: 45,
                              fontFamily: 'SF_Pro_Rounded',
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2),
                        ),
                        const Text(
                          'Borrowing Made Easy.',
                          style: TextStyle(
                              color: Color(0xFFFBFBFF),
                              fontSize: 18,
                              fontFamily: 'SF_Pro_Rounded',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 2),
                        ),
                        SizedBox(
                          height: 375,
                        ),
                        ButtonTheme(
                          minWidth: 300,
                          height: 45,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(),
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupPage()));
                              },
                              color: transparent,
                              child: Text(
                                'Sign Up',
                                style: TextStyle(color: white),
                              ),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: white),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ButtonTheme(
                          minWidth: 300,
                          height: 45,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ));
                            },
                            color: white,
                            child: Text(
                              'Login',
                              style: TextStyle(color: oxford),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 100, top: 10),
                            child: Text(
                              'Login as Admin',
                              style: TextStyle(color: white),
                            ))
                      ]),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
