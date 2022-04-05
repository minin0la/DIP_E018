import 'package:flutter/material.dart';

class collect_barcode extends StatefulWidget {
  const collect_barcode({Key? key}) : super(key: key);

  @override
  State<collect_barcode> createState() => _collect_barcodeState();
}

class _collect_barcodeState extends State<collect_barcode> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Return',
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
        child: Column(children: [
          Container(
              padding: EdgeInsets.only(top: 60),
              child: Text(
                'Scan this QR code \nto return your item',
                style: TextStyle(
                    color: Color(0xFF001D4A),
                    fontFamily: 'SF_Pro_Rounded',
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              )),
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
