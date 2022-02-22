// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:irent_app/account.dart';
import 'dart:ui';
import 'app_icons.dart';

import 'package:irent_app/app_icons.dart';
import 'package:irent_app/user_home.dart';
import 'account.dart';

class SwitchNavBar extends StatefulWidget {
  const SwitchNavBar({Key? key}) : super(key: key);

  @override
  State<SwitchNavBar> createState() => _SwitchNavBarState();
}

class _SwitchNavBarState extends State<SwitchNavBar> {
  int _selectedIndex = 0;
  static const TextStyle titleStyle = TextStyle(
      fontSize: 25, color: Color(0xFF001D4A), fontWeight: FontWeight.w500);
  static const List<Widget> _titleBar = <Widget>[
    Text(
      'iRent',
      style: titleStyle,
    ),
    Text(
      'Bookings',
      style: titleStyle,
    ),
    Text(
      'Basket',
      style: titleStyle,
    ),
    Text(
      'Account',
      style: titleStyle,
    ),
  ];
  final List<Widget> _bodyContents = <Widget>[
    user_home(),
    Text(
      'Bookings',
      style: titleStyle,
    ),
    Text(
      'Basket',
      style: titleStyle,
    ),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFBFBFF),
        centerTitle: true,
        title: _titleBar.elementAt(_selectedIndex),
        elevation: 0,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  AppIcons.notifications,
                  size: 32,
                  color: Color(0xFF001D4A),
                ),
              )),
        ],
      ),
      body: Center(
        child: _bodyContents.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Color(0xFF001D4A)),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          // this will be set when a new tab is tapped
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  AppIcons.home,
                  size: 30,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  AppIcons.bookings,
                  size: 30,
                ),
                label: "Bookings"),
            BottomNavigationBarItem(
                icon: Icon(
                  AppIcons.basket,
                  size: 30,
                ),
                label: "Basket"),
            BottomNavigationBarItem(
                icon: Icon(
                  AppIcons.account,
                  size: 30,
                ),
                label: "Account"),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFFECA400),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
