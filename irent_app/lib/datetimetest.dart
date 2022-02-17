import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:flutter/foundation.dart';

class DateTimeTest extends StatefulWidget {
  const DateTimeTest({Key? key}) : super(key: key);

  @override
  _DateTimeTestState createState() => _DateTimeTestState();
}

class _DateTimeTestState extends State<DateTimeTest> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final difference = dateRange.duration;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Book Item'),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 50, left: 30, right: 30),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: pickDateRange,
                        child: Text(DateFormat('dd/MM/yyyy').format(start)),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 30),
                      width: 150,
                      child: ElevatedButton(
                          onPressed: pickDateRange,
                          child: Text(DateFormat('dd/MM/yyyy').format(end))))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text('Duration: ${difference.inDays} days')
            ],
          ),
        ),
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: dateRange,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (newDateRange == null) return;
    setState(() => dateRange = newDateRange);
  }
}
