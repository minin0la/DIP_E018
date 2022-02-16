import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:irent_app/login.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
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
                      'Verification',
                      style: TextStyle(
                          color: Color(0xFFFBFBFF),
                          fontSize: 45,
                          fontFamily: 'SF_Pro_Rounded',
                          fontWeight: FontWeight.w500),
                    ),
                    const Text(
                      'Please check your email for verification',
                      style: TextStyle(
                          color: Color(0xFFFBFBFF),
                          fontSize: 18,
                          fontFamily: 'SF_Pro_Rounded',
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 375,
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
                          'Login Again',
                          style: TextStyle(color: Color(0xFF001D4A)),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
