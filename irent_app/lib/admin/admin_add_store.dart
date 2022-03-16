// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:irent_app/admin/admin_constants.dart';
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

  final TextStyle titleStyle = const TextStyle(
      fontFamily: 'SF_Pro_Rounded',
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xFF001D4A));

  final TextStyle fieldStyle = const TextStyle(
      fontFamily: 'SF_Pro_Rounded',
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Color(0xFF001D4A));

  bool? _success;
  String? _userEmail;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      body: Stack(
        children: [
          Column(children: [
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
                          'Add Store',
                          style: TextStyle(
                              color: oxford,
                              fontFamily: 'SF_Pro_Rounded',
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                        elevation: 0,
                        leading: SizedBox(),
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
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _inputFields(field: 'Store Name'),
                      _inputFields(field: 'Address'),
                      _dropDown(
                          context: context,
                          items: categories,
                          field: 'Category'),
                      _addBanner(field: 'Display Banner')
                    ],
                  ),
                ),
              ),
            ),
          ]),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 160,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              color: oxford,
                              fontFamily: 'SF_Pro_Rounded',
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(38))),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 160,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Add',
                          style: TextStyle(
                              color: white,
                              fontFamily: 'SF_Pro_Rounded',
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: marigold,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(38))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputFields({required String field}) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(field, style: titleStyle),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: iceberg,
              ),
              child: SingleChildScrollView(
                child: Container(
                  height: 45,
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(border: InputBorder.none),
                    style: fieldStyle,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _dropDown(
      {required BuildContext context,
      required List<String> items,
      required String field}) {
    var dropdownValue;
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(field, style: titleStyle),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: iceberg,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: const Icon(Icons.keyboard_arrow_down_sharp),
                  ),
                  iconSize: 28,
                  iconEnabledColor: Color(0xFF001D4A),
                  elevation: 16,
                  style: fieldStyle,
                  hint: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text('Select', style: fieldStyle),
                  ),
                  value: dropdownValue,
                  isDense: true,
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _addBanner({required String field}) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          field,
          style: titleStyle,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: iceberg,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '+ Add Image',
                    style: fieldStyle,
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
