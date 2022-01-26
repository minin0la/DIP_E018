// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
      ),
      home: LoginScreen(),
    );
  }
}

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
                        onPressed: () {},
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

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Create Account',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Please create an account with your student email (e.g. user@e.ntu.edu.sg',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      height: 30,
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'admin@e.ntu.edu.sg',
                            prefixIcon: Icon(Icons.person)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'admin@e.ntu.edu.sg',
                            prefixIcon: Icon(Icons.email)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'admin@e.ntu.edu.sg',
                            prefixIcon: Icon(Icons.phone)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'admin@e.ntu.edu.sg',
                            prefixIcon: Icon(Icons.vpn_key_rounded)),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
