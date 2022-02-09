// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 35,
                ),
                Container(
                  margin: EdgeInsets.only(left: 40),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        'Stephanie',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      ),
                      Text(
                        currentUser!,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  String? currentUser = FirebaseAuth.instance.currentUser?.email;
}
