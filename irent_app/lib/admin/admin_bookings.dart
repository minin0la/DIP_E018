import 'package:flutter/material.dart';
import 'package:irent_app/user_store_uroc.dart';
import 'dart:ui';
import '../app_icons.dart';

class admin_bookings extends StatefulWidget {
  const admin_bookings({Key? key}) : super(key: key);

  @override
  _admin_bookingsState createState() => _admin_bookingsState();
}

class _admin_bookingsState extends State<admin_bookings> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Bookings'));
  }
}
