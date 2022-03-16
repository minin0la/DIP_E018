import 'package:flutter/material.dart';
import 'package:irent_app/user_store_uroc.dart';
import 'dart:ui';
import '../app_icons.dart';

class admin_transactions extends StatefulWidget {
  const admin_transactions({Key? key}) : super(key: key);

  @override
  _admin_transactionsState createState() => _admin_transactionsState();
}

class _admin_transactionsState extends State<admin_transactions> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Transactions'));
  }
}
