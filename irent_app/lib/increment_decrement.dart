import 'package:flutter/material.dart';

class increment_decrement extends StatefulWidget {
  const increment_decrement({Key? key}) : super(key: key);

  @override
  State<increment_decrement> createState() => _increment_decrementState();
}

class _increment_decrementState extends State<increment_decrement> {
  int _itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(219, 228, 238, 1),
                shape: BoxShape.circle),
            child: InkWell(
              onTap: () {
                setState(() {
                  _itemCount -= 1;
                });
              },
              child: Icon(Icons.remove, color: Color.fromRGBO(0, 29, 74, 1)),
            ),
          ),
          SizedBox(
              width: 20,
              height: 20,
              child: Text(
                '$_itemCount',
                textAlign: TextAlign.center,
              )),
          Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(219, 228, 238, 1),
                shape: BoxShape.circle),
            child: InkWell(
              onTap: () {
                setState(() {
                  _itemCount += 1;
                });
              },
              child: Icon(Icons.add, color: Color.fromRGBO(0, 29, 74, 1)),
            ),
          ),
        ],
      ),
    );
  }
}
