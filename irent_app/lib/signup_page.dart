// ignore_for_file: prefer_const_constructors, deprecated_member_use
//firebase firestore https://www.youtube.com/watch?v=1_xKjeQXa3A
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  bool agree = false;
  bool? _success;
  String _userEmail = '';
  String _register_reason = '';

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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Create Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'SF_Pro_Rounded',
                          color: Color(0xFF001D4A)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Please create an account with your student email\n (e.g. user@e.ntu.edu.sg)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'SF_Pro_Rounded',
                          color: Color(0xFF001D4A)),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400)),
                            border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400)),
                            labelText: 'Name',
                            prefixIcon: Icon(Icons.person),
                            hintText: 'John Smith')),
                    SizedBox(
                      height: 10,
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
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          labelText: 'Email',
                          hintText: 'admin@e.ntu.edu.sg',
                          prefixIcon: Icon(Icons.email)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _phoneNumberController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your mobile number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          hintText: '9245XXXX',
                          labelText: 'Mobile No',
                          prefixIcon: Icon(Icons.phone)),
                    ),
                    SizedBox(
                      height: 10,
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
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400)),
                          border: UnderlineInputBorder(
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
                              'By clicking this button, you are agreeing to our Terms and Conditions',
                              style: TextStyle(color: Color(0xFF001D4A)),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonTheme(
                      minWidth: 300,
                      height: 45,
                      child: RaisedButton(
                        onPressed: agree
                            ? () async {
                                if (_formKey.currentState!.validate()) {
                                  await _register();

                                  if (_success == true) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePage()));
                                  }
                                }
                              }
                            : null,
                        color: Color(0xFFECA400),
                        child: Text(
                          'Login',
                          style: TextStyle(color: Color(0xFFFBFBFF)),
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
                                : 'Registration failed ($_register_reason)'),
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
    try {
      final User? user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        await users
            .doc(user.uid)
            .set({
              'email': _emailController.text,
              'name': _nameController.text,
              'phone_number': int.parse(_phoneNumberController.text),
            })
            .then((value) => setState(() {
                  _success = true;
                  _userEmail = user.email ?? '';
                }))
            .catchError((error) => _success = false);
      } else {
        _success = false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        setState(() {
          _success = false;
          _register_reason = 'The account already exists for that email.';
        });
      }
    } catch (e) {
      setState(() {
        _success = false;
        _register_reason = e.toString();
      });
    }
  }
}
