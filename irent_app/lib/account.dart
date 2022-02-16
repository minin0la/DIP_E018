// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:irent_app/app_icons.dart';
import 'login_register.dart';

class AccountScreen extends StatelessWidget {
  final Color white = const Color(0xFFFBFBFF);
  final Color oxford = const Color(0xFF001D4A);
  final Color aliceblue = const Color(0xFF81A4CD);
  final Color marigold = const Color(0xFFECA400);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                //decoration: BoxDecoration(color: Colors.blue),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://media-exp1.licdn.com/dms/image/C5603AQEAYIB6hWfkgA/profile-displayphoto-shrink_400_400/0/1602090886800?e=1650499200&v=beta&t=_duzbNOrf3t68Nr_md8-8Z9G4ABb4cAyVYWY4GS85P0'),
                      radius: 50,
                    ),
                    SizedBox(width: 20),
                    Container(
                      //decoration: BoxDecoration(color: Colors.yellow),
                      height: 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Stephanie",
                            style: TextStyle(
                              color: oxford,
                              fontFamily: "SF_Pro_Rounded",
                              fontWeight: FontWeight.w700,
                              fontSize: 22.0,
                            ),
                          ),
                          Text(
                            "STEPH001@e.ntu.edu.sg",
                            style: TextStyle(
                              color: Color(0x99001D4A),
                              fontFamily: "SF_Pro_Rounded",
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                //decoration: BoxDecoration(color: Colors.blue),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text(
                            "My Account",
                            style: TextStyle(
                              color: oxford,
                              fontFamily: "SF_Pro_Rounded",
                              fontWeight: FontWeight.w700,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 1.0, color: aliceblue),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "My Profile",
                                  style: TextStyle(
                                    color: oxford,
                                    fontFamily: "SF_Pro_Rounded",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                  ),
                                ),
                                SizedBox(width: 220),
                                GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color: oxford,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 1.0, color: aliceblue),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Change Password",
                                  style: TextStyle(
                                    color: oxford,
                                    fontFamily: "SF_Pro_Rounded",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                  ),
                                ),
                                SizedBox(width: 160),
                                GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color: oxford,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 1.0, color: aliceblue),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "History",
                                  style: TextStyle(
                                    color: oxford,
                                    fontFamily: "SF_Pro_Rounded",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0,
                                  ),
                                ),
                                SizedBox(width: 235),
                                GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                    color: oxford,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 3,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  //decoration: BoxDecoration(color: Colors.blue),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Support",
                              style: TextStyle(
                                color: oxford,
                                fontFamily: "SF_Pro_Rounded",
                                fontWeight: FontWeight.w700,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(width: 1.0, color: aliceblue),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "About Us",
                                    style: TextStyle(
                                      color: oxford,
                                      fontFamily: "SF_Pro_Rounded",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(width: 225),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                      color: oxford,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(width: 1.0, color: aliceblue),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Feedback",
                                    style: TextStyle(
                                      color: oxford,
                                      fontFamily: "SF_Pro_Rounded",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(width: 220),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                      color: oxford,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(width: 1.0, color: aliceblue),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "My Profile",
                                    style: TextStyle(
                                      color: oxford,
                                      fontFamily: "SF_Pro_Rounded",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(width: 220),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 20,
                                      color: oxford,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ]),
                  )),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 50,
              width: 150,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(38.0),
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginRegisterScreen()));
                },
                padding: EdgeInsets.all(10.0),
                color: marigold,
                textColor: Colors.white,
                child: Text("Logout", style: TextStyle(fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
