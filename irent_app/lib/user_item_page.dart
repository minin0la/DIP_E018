import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class user_item_page extends StatefulWidget {
  const user_item_page({Key? key}) : super(key: key);

  @override
  _user_item_pageState createState() => _user_item_pageState();
}

class _user_item_pageState extends State<user_item_page> {
  DateTime dateTime = DateTime(2022);
  TimeOfDay _time = TimeOfDay.now();
  var value = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Container(
          height: 340,
          width: 420,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              image: DecorationImage(
                  image: AssetImage('images/Image_mariokartdeluxe.jpg'),
                  colorFilter: new ColorFilter.mode(
                      Color.fromRGBO(129, 164, 205, 0.5), BlendMode.lighten),
                  fit: BoxFit.cover)),
        ),
        Container(
            child: Text(
          'Mario Kart 8 Deluxe',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(0, 29, 74, 1),
              fontFamily: 'SF Pro Rounded',
              fontSize: 27,
              letterSpacing: 0,
              fontWeight: FontWeight.bold,
              height: 1),
        )),
        Container(
            child: Text(
          'Console Game',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(0, 29, 74, 1),
              fontFamily: 'SF Pro Rounded',
              fontSize: 18,
              letterSpacing: 0,
              fontWeight: FontWeight.w300,
              height: 1),
        )),
        Container(
            child: Text(
          '\$1 / Hour ',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(0, 29, 74, 1),
              fontFamily: 'SF Pro Rounded',
              fontSize: 18,
              letterSpacing: 0,
              fontWeight: FontWeight.bold,
              height: 1),
        )),
        ElevatedButton(
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
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: '${dateTime.day}-${dateTime.month}-${dateTime.year}',
                style: TextStyle(
                    color: Color.fromRGBO(251, 251, 255, 1),
                    fontFamily: 'SF Pro Rounded',
                    fontSize: 16,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal)),
            WidgetSpan(child: Icon(Icons.arrow_drop_down_outlined)),
          ])),
        ),
        ElevatedButton(
          onPressed: () async {
            TimeOfDay? newTime = await showTimePicker(
              context: context,
              initialTime: _time,
            );
            if (newTime != null) {
              setState(() {
                _time = newTime;
              });
            }
          },
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: '${_time.format(context)}',
                style: TextStyle(
                    color: Color.fromRGBO(251, 251, 255, 1),
                    fontFamily: 'SF Pro Rounded',
                    fontSize: 16,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal)),
            WidgetSpan(child: Icon(Icons.arrow_drop_down_outlined)),
          ])),
        ),
        Expanded(
          child: Center(
            child: Text("$value"),
          ),
        ),
        CupertinoTimerPicker(
          mode: CupertinoTimerPickerMode.hm,
          onTimerDurationChanged: (value) {
            setState(() {
              this.value = value.toString();
            });
          },
        ),
      ]),
    );
  }
}
