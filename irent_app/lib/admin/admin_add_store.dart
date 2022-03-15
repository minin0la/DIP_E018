// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:irent_app/switch_nav.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

enum FeedbackType { report, suggestion }

class AddStorePage extends StatefulWidget {
  const AddStorePage({Key? key}) : super(key: key);

  @override
  State<AddStorePage> createState() => _AddStorePageState();
}

class _AddStorePageState extends State<AddStorePage> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Color white = const Color(0xFFFBFBFF);
  final Color oxford = const Color(0xFF001D4A);
  final Color aliceblue = const Color(0xFF81A4CD);
  final Color iceberg = const Color(0xFFDBE4EE);
  final Color marigold = const Color(0xFFECA400);
  final Color transparent = const Color(0x4DE3E3E3);

  FeedbackType? _feedbackType = FeedbackType.report;

  bool? _success;
  String? _userEmail;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      body: Column(children: [
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
                    'images/cross-bg-cropped-2.png',
                  ),
                ),
                Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    centerTitle: true,
                    title: Text(
                      'Feedback',
                      style: TextStyle(
                          color: oxford,
                          fontFamily: 'SF_Pro_Rounded',
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    elevation: 0,
                    leading: Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            size: 32,
                            color: oxford,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 160,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {},
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _inputFields({required String option, required FeedbackType value}) {
    return Row(
      children: [
        Text(
          "Comments",
          style: TextStyle(
              fontFamily: 'SF_Pro_Rounded',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: oxford),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: iceberg,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: TextField(
                    keyboardType: TextInputType.multiline,
                    minLines: 10,
                    maxLines: 10,
                    decoration:
                        InputDecoration.collapsed(hintText: 'Type here')),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
