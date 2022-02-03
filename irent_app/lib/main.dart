// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signup_page.dart';
import 'login_register.dart';
import 'homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final FirebaseAuth _auth = FirebaseAuth.instance;

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

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool agree = false;
  bool? _success;
  String _userEmail = '';

  @override
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Form(
              key: _formKey,
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
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
                      'Please create an account with your student email\n (e.g. user@e.ntu.edu.sg)',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400)),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400)),
                            labelText: 'Name',
                            prefixIcon: Icon(Icons.person),
                            hintText: 'John Smith')),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailController,
                      validator: (String? value) {
                        bool emailValid =
                            RegExp(r'^[A-Za-z0-9._%+-]+@e.ntu.edu.sg$')
                                .hasMatch(value!);
                        if (value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!emailValid && value.isNotEmpty) {
                          return 'Please use NTU Email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          labelText: 'Email',
                          hintText: 'admin@e.ntu.edu.sg',
                          prefixIcon: Icon(Icons.email)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your mobile number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          hintText: '9245XXXX',
                          labelText: 'Mobile No',
                          prefixIcon: Icon(Icons.phone)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: '*******',
                          labelText: 'Password',
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          prefixIcon: Icon(Icons.vpn_key_rounded)),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        // for checkbox validation link, check https://www.kindacode.com/article/flutter-i-agree-to-terms-checkbox-example/
                        Checkbox(
                            value: agree,
                            onChanged: (value) {
                              setState(() {
                                agree = value ?? false;
                              });
                            }),
                        SizedBox(
                            width: 250,
                            child: Text(
                                'By clicking this button, you are agreeing to our Terms and Conditions'))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonTheme(
                      minWidth: 300,
                      child: RaisedButton(
                        onPressed: agree
                            ? () async {
                                if (_formKey.currentState!.validate()) {
                                  await _register();
                                  if (_success = true) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePage()));
                                  }
                                }
                              }
                            : null,
                        color: Colors.blue,
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        _success == null
                            ? ''
                            : (_success!
                                ? 'Successfully registered $_userEmail'
                                : 'Registration failed'),
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email ?? '';
      });
    } else {
      _success = false;
    }
  }
}
