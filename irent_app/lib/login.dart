// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:irent_app/switch_nav.dart';
import 'package:irent_app/verification.dart';
import 'homepage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool? _success;
  bool? _verified;
  String? _userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFFBFBFF)),
        elevation: 0,
        backgroundColor: Color(0xFF81A4CD),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.width * 0.8,
                color: Color(0xFF81A4CD),
                child: Container(
                  margin: EdgeInsets.only(left: 30, top: 0),
                  child: Text(
                    'Hello,\nStephanie',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SF_Pro_Rounded',
                      color: Color(0xFFFBFBFF),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 40),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
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
                        height: 40,
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
                            labelText: 'Password',
                            hintText: '******',
                            prefixIcon: Icon(Icons.lock),
                            floatingLabelBehavior:
                                FloatingLabelBehavior.always),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 43,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (_formKey.currentState!.validate()) {
                                await _signInWithEmailAndPassword();
                                if (_success == true) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SwitchNavBar()));
                                } else if (_verified == false) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const VerificationPage()));
                                }
                              }
                            }
                          },
                          child: Text('Login'),
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signInWithEmailAndPassword() async {
    final User? user = (await _auth.signInWithEmailAndPassword(
      email: _emailField.text,
      password: _passwordField.text,
    ))
        .user;

    if (user != null && !user.emailVerified) {
      setState(() {
        _success = false;
        _verified = false;
        // _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = true;
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
