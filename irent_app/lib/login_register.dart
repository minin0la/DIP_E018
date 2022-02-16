// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'login.dart';
import 'signup_page.dart';
import 'dart:ui';

class LoginRegisterScreen extends StatelessWidget {
  const LoginRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 50, bottom: 100),
              width: screenwidth,
              color: Color(0xFF81A4CD),
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
                          fontWeight: FontWeight.w500),
                    ),
                    const Text(
                      'Borrowing Made Easy.',
                      style: TextStyle(
                          color: Color(0xFFFBFBFF),
                          fontSize: 18,
                          fontFamily: 'SF_Pro_Rounded',
                          fontWeight: FontWeight.w400),
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
                                    builder: (context) => const SignupPage()));
                          },
                          color: Color(0x4DE3E3E3),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Color(0xFFFBFBFF)),
                          ),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Color(0xFFFBFBFF)),
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
                        color: Color(0xFFFBFBFF),
                        child: Text(
                          'Login',
                          style: TextStyle(color: Color(0xFF001D4A)),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 100, top: 10),
                        child: Text(
                          'Login as Admin',
                          style: TextStyle(color: Color(0xFFFBFBFF)),
                        ))
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
