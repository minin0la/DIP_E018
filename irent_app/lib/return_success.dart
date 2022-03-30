import 'package:flutter/material.dart';
import 'package:irent_app/user_home.dart';

class return_success extends StatefulWidget {
  final Color white = const Color(0xFFFBFBFF);
  final Color oxford = const Color(0xFF001D4A);
  final Color aliceblue = const Color(0xFF81A4CD);
  final Color iceberg = const Color(0xFFDBE4EE);
  final Color marigold = const Color(0xFFECA400);
  final Color transparent = const Color(0x4DE3E3E3);

  const return_success({Key? key}) : super(key: key);

  @override
  State<return_success> createState() => _return_successState();
}

class _return_successState extends State<return_success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Return',
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
                      'Item Returned Successfully',
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
                      'Thank You for using iRent.',
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
                  'See you again!.',
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
                      width: 140,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => user_home())));
                        },
                        child: Text(
                          'Go to Home',
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
