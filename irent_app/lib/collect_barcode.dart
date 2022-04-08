import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:getwidget/getwidget.dart';

enum Condition { yes, no }
enum qns2 { yes, no }

class collect_barcode extends StatefulWidget {
  const collect_barcode({Key? key}) : super(key: key);

  @override
  State<collect_barcode> createState() => _collect_barcodeState();
}

class _collect_barcodeState extends State<collect_barcode> {
  final controller = TextEditingController();
  final Color white = const Color(0xFFFBFBFF);
  final Color oxford = const Color(0xFF001D4A);
  final Color aliceblue = const Color(0xFF81A4CD);
  final Color iceberg = const Color(0xFFDBE4EE);
  final Color marigold = const Color(0xFFECA400);
  final Color transparent = const Color(0x4DE3E3E3);
  Condition? _condition;
  qns2? _qns2;

  void initState() {
    super.initState();

    Timer(Duration(seconds: 1), () {
      //triggered action after countdown
      showModalBottomSheet<void>(
        isDismissible: false,
        enableDrag: false,
        context: context,
        backgroundColor: Color(0xFF001D4A),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.0),
          ),
        ),
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter state) {
            return SizedBox(
              height: 475,
              child: Column(children: [
                ListTile(
                  title: Center(
                      child: Text(
                    'Item Quality Check',
                    style: TextStyle(
                        color: Color(0xFFFBFBFF),
                        fontFamily: 'SF_Pro_Rounded',
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  )),
                ),
                Divider(
                  color: Colors.white,
                ),
                ListBody(
                  children: [
                    Text(
                      '1. Is the item in good condition? (i.e., no significant tear, graffiti, water mark, etc.)',
                      style: TextStyle(
                          color: Color(0xFFFBFBFF),
                          fontFamily: 'SF_Pro_Rounded',
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                    GFRadioListTile(
                      activeBgColor: Colors.white,
                      position: GFPosition.start,
                      size: 25,
                      title: Text(
                        'Yes',
                        style: TextStyle(
                            color: Color(0xFFFBFBFF),
                            fontFamily: 'SF_Pro_Rounded',
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                      value: Condition.yes,
                      groupValue: _condition,
                      onChanged: (value1) {
                        state(() {
                          _condition = value1;
                        });
                      },
                    ),
                    GFRadioListTile(
                      activeBgColor: Colors.white,
                      position: GFPosition.start,
                      size: 25,
                      title: Text(
                        'No',
                        style: TextStyle(
                            color: Color(0xFFFBFBFF),
                            fontFamily: 'SF_Pro_Rounded',
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                      value: Condition.no,
                      groupValue: _condition,
                      onChanged: (value2) {
                        state(() {
                          _condition = value2;
                        });
                      },
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Text(
                      '2. Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ?',
                      style: TextStyle(
                          color: Color(0xFFFBFBFF),
                          fontFamily: 'SF_Pro_Rounded',
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                    GFRadioListTile(
                      activeBgColor: Colors.white,
                      position: GFPosition.start,
                      size: 25,
                      title: Text(
                        'Yes',
                        style: TextStyle(
                            color: Color(0xFFFBFBFF),
                            fontFamily: 'SF_Pro_Rounded',
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                      value: qns2.yes,
                      groupValue: _qns2,
                      onChanged: (value3) {
                        state(() {
                          _qns2 = value3;
                        });
                      },
                    ),
                    GFRadioListTile(
                      activeBgColor: Colors.white,
                      position: GFPosition.start,
                      size: 25,
                      title: Text(
                        'No',
                        style: TextStyle(
                            color: Color(0xFFFBFBFF),
                            fontFamily: 'SF_Pro_Rounded',
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                      value: qns2.no,
                      groupValue: _qns2,
                      onChanged: (value4) {
                        state(() {
                          _qns2 = value4;
                        });
                      },
                    ),
                  ],
                ),
                InkWell(
                  onTap: (() {
                    Navigator.pop(context); //data to be pass
                  }),
                  child: Container(
                      height: 35,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color.fromRGBO(236, 164, 0, 1),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Confirm',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'SF Pro Rounded',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                ),
              ]),
            );
          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Collect ',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(0, 29, 74, 1),
              fontFamily: 'SF_Pro_Rounded',
              fontSize: 25,
              fontWeight: FontWeight.w500),
        ),
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Scan this QR code \nto collect your item',
            style: TextStyle(
                color: Color(0xFF001D4A),
                fontFamily: 'SF_Pro_Rounded',
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          Container(
              padding: EdgeInsets.only(top: 40),
              child: QrImage(
                data: controller.text,
                size: 200,
              )),
          Container(
              padding: EdgeInsets.only(top: 40),
              child: Text('Collect at',
                  style: TextStyle(
                      color: Color(0xFF001D4A),
                      fontFamily: 'SF_Pro_Rounded',
                      fontSize: 20,
                      fontWeight: FontWeight.w700))),
          Container(
              child: Text(
            'Box #1',
            style: TextStyle(
                color: Color(0xFF001D4A),
                fontFamily: 'SF_Pro_Rounded',
                fontSize: 20,
                fontWeight: FontWeight.w500),
          )),
        ]),
      ),
    );
  }
}
