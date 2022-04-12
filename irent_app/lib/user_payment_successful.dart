import 'package:flutter/material.dart';
import 'package:irent_app/user_bookings.dart';

class user_payment_successful extends StatefulWidget {
  const user_payment_successful({Key? key}) : super(key: key);

  @override
  State<user_payment_successful> createState() =>
      _user_payment_successfulState();
}

class _user_payment_successfulState extends State<user_payment_successful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Payment',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFF001D4A),
              fontFamily: 'SF_Pro_Rounded',
              fontSize: 25,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                ),
              ],
            ),
            Column(
              children: [
                Container(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      'Payment Successful',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF001D4A),
                          fontFamily: 'SF Pro Rounded',
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          height: 1),
                    )),
              ],
            ),
            Column(
              children: [
                Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Total Payment: ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF001D4A),
                          fontFamily: 'SF Pro Rounded',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          height: 1),
                    )),
              ],
            ),
            Column(
              children: [
                Container(
                    child: Text(
                  ' \$2',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF001D4A),
                      fontFamily: 'SF Pro Rounded',
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      height: 1),
                )),
              ],
            ),
            Column(
              children: [
                Container(
                    padding: EdgeInsets.only(top: 60, bottom: 10),
                    child: SizedBox(
                      width: 160,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => user_bookings())));
                        },
                        child: Text(
                          'Go to Bookings',
                          style: TextStyle(
                              color: Color(0xFFFBFBFF),
                              fontFamily: 'SF_Pro_Rounded',
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF001D4A),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(38))),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
