// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:irent_app/not_verified.dart';
import 'package:irent_app/switch_nav.dart';

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

  final Color white = const Color(0xFFFBFBFF);
  final Color oxford = const Color(0xFF001D4A);
  final Color aliceblue = const Color(0xFF81A4CD);
  final Color marigold = const Color(0xFFECA400);
  final Color transparent = const Color(0x4DE3E3E3);
  bool? _success;
  bool? _verified;
  String? _userEmail;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          iconTheme: IconThemeData(color: white),
          elevation: 0,
          backgroundColor: aliceblue),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.width * 0.8,
                color: aliceblue,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        'Hello,\nStephanie',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'SF_Pro_Rounded',
                          color: white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.only(right: 30),
                      child: Image.asset(
                        'images/tool-box.png',
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                    )
                  ],
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
                          onPressed: () {
                            _signInWithEmailAndPassword(
                                _emailField.text, _passwordField.text);
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
                                  ? 'Successfully signed in '
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

  void _signInWithEmailAndPassword(
      String emailField, String passwordField) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(
                email: emailField, password: passwordField)
            .then(
              (user) => {
                if (user.user?.emailVerified == true)
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SwitchNavBar())),
                    // ScaffoldMessenger.of(context)
                    //     .showSnackBar(SnackBar(content: Text("Login success")))
                  }
                else if (user.user?.emailVerified == false)
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NotVerified())),
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text("Please verify your email")))
                  }
              },
            );
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(errorMessage!)));
        print(error.code);
      }
    }
  }

  @override
  void dispose() {
    _emailField.dispose();
    _passwordField.dispose();
    super.dispose();
  }
}
