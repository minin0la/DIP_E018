// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:irent_app/switch_nav.dart';
import 'homepage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Color white = const Color(0xFFFBFBFF);
  final Color oxford = const Color(0xFF001D4A);
  final Color aliceblue = const Color(0xFF81A4CD);
  final Color marigold = const Color(0xFFECA400);
  final Color transparent = const Color(0x4DE3E3E3);
  bool? _success;
  String? _userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: aliceblue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      )),
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          'images/cross-bg-cropped.png',
                          //height: MediaQuery.of(context).size.height * 0.15,
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(height: 80),
                          Container(
                            alignment: Alignment.bottomRight,
                            child: Image.asset(
                              'images/appbar.png',
                              height: MediaQuery.of(context).size.height * 0.15,
                            ),
                          )
                        ],
                      ),
                      Scaffold(
                        backgroundColor: Colors.transparent,
                        appBar: AppBar(
                          backgroundColor: Colors.transparent,
                          centerTitle: true,
                          title: Text(
                            'Edit Profile',
                            style: TextStyle(
                                color: white,
                                fontFamily: 'SF_Pro_Rounded',
                                fontSize: 25,
                                fontWeight: FontWeight.w500),
                          ),
                          elevation: 0,
                          leading: Padding(
                              padding: EdgeInsets.only(right: 20.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.close,
                                  size: 32,
                                  color: white,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 40),
                  color: white,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        TextFormField(
                          controller: _emailField,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your NTU email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'Name',
                              hintText: 'John Doe',
                              prefixIcon: Icon(Icons.person),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _emailField,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your NTU email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'john@e.ntu.edu.sg',
                              prefixIcon: Icon(Icons.email),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _passwordField,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'Mobile Number',
                              hintText: '+65XXXXXXXX',
                              prefixIcon: Icon(Icons.lock),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                        ),
                        SizedBox(
                          height: 200,
                        ),
                        SizedBox(
                          width: 160,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                if (_formKey.currentState!.validate()) {
                                  await _signInWithEmailAndPassword();
                                  if (_success = true) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SwitchNavBar()));
                                  }
                                }
                              }
                            },
                            child: Text(
                              'Save',
                              style: TextStyle(
                                  color: white,
                                  fontFamily: 'SF_Pro_Rounded',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFFECA400),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(38))),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            _success == null
                                ? ''
                                : (_success!
                                    ? 'Successfully signed in ' + _userEmail!
                                    : 'Sign in failed'),
                            style: TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Center(
            widthFactor: 3.5,
            heightFactor: 3.5,
            child: Container(
              width: 110,
              height: 110,
              child: MaterialButton(
                shape: CircleBorder(),
                child: Stack(children: [
                  Image.asset(
                    'images/profile.png',
                    width: 110,
                    height: 110,
                  ),
                  Text("Edit"),
                ]),
                color: oxford,
                textColor: white,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

//Not edited
  Future<void> _signInWithEmailAndPassword() async {
    final User? user = (await _auth.signInWithEmailAndPassword(
      email: _emailField.text,
      password: _passwordField.text,
    ))
        .user;

    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = false;
      });
    }
  }

  @override
  void dispose() {
    _emailField.dispose();
    _passwordField.dispose();
    super.dispose();
  }
}
