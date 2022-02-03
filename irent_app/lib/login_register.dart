// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'main.dart';
import 'login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
              color: Colors.grey.shade400,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'iRent',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('Borrowing made easy.'),
                    SizedBox(
                      height: 100,
                    ),
                    ButtonTheme(
                      minWidth: 300,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupPage()));
                        },
                        color: Colors.grey.shade300,
                        child: Text('Sign Up'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    ButtonTheme(
                      minWidth: 300,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ));
                        },
                        color: Colors.white,
                        child: Text('Login'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 100, top: 10),
                        child: Text('Login as Admin'))
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
