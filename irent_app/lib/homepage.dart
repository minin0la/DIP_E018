// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:irent_app/login_register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.grey),
          child: Drawer(
              child: ListView(
            padding: EdgeInsets.zero,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 30, top: 30),
                child: Container(
                  height: 200,
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
                          Map<String, dynamic> data =
                              snapshot.data!.data() as Map<String, dynamic>;
                          return Center(
                              // here only return is missing
                              child: Text(data['name']));
                        }
                      } else if (snapshot.hasError) {
                        return Text('no data');
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                  // child: DrawerHeader(
                  //   child: Column(
                  //     // ignore: prefer_const_literals_to_create_immutables
                  //     children: [
                  //       CircleAvatar(
                  //         radius: 40,
                  //       ),
                  //       SizedBox(
                  //         height: 30,
                  //       ),
                  //       Text(
                  //         'Stephanie',
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 25,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ),
              ),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                title: const Text('Home'),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                title: const Text('Account'),
                leading: Icon(Icons.person),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                title: const Text('History'),
                leading: Icon(Icons.calendar_view_day_rounded),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                title: const Text('Feedback'),
                leading: Icon(Icons.feedback),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                padding: EdgeInsets.only(right: 90, left: 20),
                margin: EdgeInsets.only(top: 120),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey.shade300,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const LoginRegisterScreen()));
                    },
                    child: Text('Sign Out')),
              )
            ],
          )),
        ),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
