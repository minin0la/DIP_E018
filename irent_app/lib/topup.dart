import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:irent_app/app_icons.dart';
import 'package:irent_app/database.dart';
import 'login_register.dart';

enum PaymentType { paylah, paynow }

class TopUpPage extends StatefulWidget {
  const TopUpPage({Key? key}) : super(key: key);

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  final Color white = const Color(0xFFFBFBFF);
  final Color oxford = const Color(0xFF001D4A);
  final Color aliceblue = const Color(0xFF81A4CD);
  final Color iceberg = const Color(0xFF81A4CD);
  final Color marigold = const Color(0xFFECA400);
  final TextStyle titleStyle = const TextStyle(
    fontFamily: "SF_Pro_Rounded",
    color: Color(0xFF001D4A),
    fontSize: 25,
    fontWeight: FontWeight.w500,
  );
  final TextStyle subtitleStyle = const TextStyle(
    fontFamily: "SF_Pro_Rounded",
    color: Color(0xFF001D4A),
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  String? currentuser = FirebaseAuth.instance.currentUser?.email;

  PaymentType? _paymentType = PaymentType.paylah;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: Text(
          'Top Up',
          style: titleStyle,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Payment Method',
              style: subtitleStyle,
            ),
            _radioButton(option: 'PayLah!', value: PaymentType.paylah),
            _radioButton(option: 'PayNow', value: PaymentType.paynow),
          ],
        ),
      ),
    );
  }

  Widget _radioButton({required String option, required PaymentType value}) {
    return Container(
      color: aliceblue,
      child: RadioListTile<PaymentType>(
        title: Text(
          option,
          style: TextStyle(
              fontFamily: 'SF_Pro_Rounded',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: oxford),
        ),
        value: value,
        groupValue: _paymentType,
        onChanged: (PaymentType? value) {
          setState(() {
            _paymentType = value;
          });
        },
        contentPadding: EdgeInsets.all(0),
        activeColor: oxford,
      ),
    );
  }
}
