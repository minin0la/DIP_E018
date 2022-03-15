import 'package:flutter/material.dart';

class date extends StatefulWidget {
  const date({Key? key}) : super(key: key);

  @override
  State<date> createState() => _dateState();
}

class _dateState extends State<date> {
  DateTime dateTime = DateTime(2022);
  TimeOfDay _time = TimeOfDay.now();
  String initialValue = '12 AM';

  var itemList = [
    '12 AM',
    '1 AM',
    '2 AM',
    '3 AM',
    '4 AM',
    '5 AM',
    '6 AM',
    '7 AM',
    '8 AM',
    '9 AM',
    '10 AM',
    '11 AM',
    '12 PM',
    '1 PM',
    '2 PM',
    '3 PM',
    '4 PM',
    '5 PM',
    '6 PM',
    '7 PM',
    '8 PM',
    '9 PM',
    '10 PM',
    '11 PM',
  ];

  int _count = 0;

  void _increamentCount() {
    setState(() {
      _count++;
    });
  }

  void _decreamentCount() {
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 30,
                    width: 100,
                    child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: dateTime,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2300));
                            if (newDate != null) {
                              setState(() {
                                dateTime = newDate;
                              });
                            }
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Color.fromRGBO(0, 29, 74, 1),
                            size: 20,
                          ),
                          label: Text(
                              '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 29, 74, 1),
                                  fontFamily: 'SF Pro Rounded',
                                  fontSize: 10,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal)),
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(158, 41),
                            primary: Color.fromRGBO(219, 228, 238, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
              SizedBox(height: 30, width: 5)
            ],
          ),
          Column(
            children: [
              Container(
                height: 30,
                width: 100,
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: dateTime,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2300));
                        if (newDate != null) {
                          setState(() {
                            dateTime = newDate;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Color.fromRGBO(0, 29, 74, 1),
                        size: 20,
                      ),
                      label: Text(
                          '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 29, 74, 1),
                              fontFamily: 'SF Pro Rounded',
                              fontSize: 10,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal)),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(158, 41),
                        primary: Color.fromRGBO(219, 228, 238, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
