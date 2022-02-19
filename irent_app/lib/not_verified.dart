import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:irent_app/app_icons.dart';
import 'package:irent_app/database.dart';
import 'login_register.dart';

class NotVerified extends StatelessWidget {
  final Color white = const Color(0xFFFBFBFF);
  final Color oxford = const Color(0xFF001D4A);
  final Color aliceblue = const Color(0xFF81A4CD);
  final Color marigold = const Color(0xFFECA400);
  String? currentuser = FirebaseAuth.instance.currentUser?.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/no.png',
                    height: 210,
                    width: 210,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Email Not Verified",
                    style: TextStyle(
                        color: oxford,
                        fontSize: 25,
                        fontFamily: 'SF_Pro_Rounded',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),
                  Text(
                    "Please check your email",
                    style: TextStyle(
                        color: oxford,
                        fontSize: 15,
                        fontFamily: 'SF_Pro_Rounded',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      "Didn't receive the verification email?",
                      style: TextStyle(
                          color: oxford,
                          fontSize: 15,
                          fontFamily: 'SF_Pro_Rounded',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Resend Email',
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: TextStyle(
                          color: oxford,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'SF_Pro_Rounded',
                          letterSpacing: 1,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                )),
          ]),
        ),
      ),
    );
  }
}
