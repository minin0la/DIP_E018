// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:irent_app/admin/admin_constants.dart';
import 'package:irent_app/switch_nav.dart';
import 'admin_store_items.dart';

enum FeedbackType { report, suggestion }

class AdminEditItemPage extends StatefulWidget {
  final ItemDataModel itemDataModel;
  const AdminEditItemPage({Key? key, required this.itemDataModel})
      : super(key: key);

  @override
  _AdminEditItemPageState createState() => _AdminEditItemPageState();
}

class _AdminEditItemPageState extends State<AdminEditItemPage> {
  final Color white = const Color(0xFFFBFBFF);
  final Color oxford = const Color(0xFF001D4A);
  final Color indigo = const Color(0xFF27476E);
  final Color aliceblue = const Color(0xFF81A4CD);
  final Color iceberg = const Color(0xFFDBE4EE);
  final Color marigold = const Color(0xFFECA400);
  final Color transparent = const Color(0x4DE3E3E3);

  final TextStyle titleStyle = const TextStyle(
      fontFamily: 'SF_Pro_Rounded',
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Color(0xFF001D4A));

  final TextStyle fieldStyle = const TextStyle(
      fontFamily: 'SF_Pro_Rounded',
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Color(0xFF001D4A));

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      body: Stack(
        children: [
          Column(children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: aliceblue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    )),
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'images/cross-bg-cropped-2.png',
                      ),
                    ),
                    Scaffold(
                      backgroundColor: Colors.transparent,
                      appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        centerTitle: true,
                        title: Text(
                          'Edit Item',
                          style: TextStyle(
                              color: oxford,
                              fontFamily: 'SF_Pro_Rounded',
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                        elevation: 0,
                        leading: SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _inputFields(
                          field: 'Name',
                          initialValue: widget.itemDataModel.name),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('Price', style: titleStyle),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: iceberg,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text('\$'),
                                        )),
                                    Expanded(
                                      flex: 7,
                                      child: SingleChildScrollView(
                                        child: Container(
                                          height: 40,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, bottom: 8),
                                            child: TextFormField(
                                              maxLines: 1,
                                              decoration: InputDecoration(
                                                  border: InputBorder.none),
                                              style: fieldStyle,
                                              keyboardType:
                                                  TextInputType.number,
                                              initialValue: widget
                                                  .itemDataModel.pricePerHour,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: Text('/ hour'),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      _inputFields(
                          field: 'Available Quantity',
                          initialValue: widget.itemDataModel.quantity),
                      _addBanner(
                          field: 'Display Picture',
                          displayPicture: widget.itemDataModel.displayPicture),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('Box Number', style: titleStyle),
                          ),
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Press here to get QR Code',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: marigold,
                                      fontFamily: 'SF_Pro_Rounded',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 160,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              color: oxford,
                              fontFamily: 'SF_Pro_Rounded',
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(38))),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 160,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Save',
                          style: TextStyle(
                              color: white,
                              fontFamily: 'SF_Pro_Rounded',
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: marigold,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(38))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputFields({required String field, required String initialValue}) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(field, style: titleStyle),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: iceberg,
              ),
              child: SingleChildScrollView(
                child: Container(
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 7),
                    child: TextFormField(
                      maxLines: 1,
                      initialValue: initialValue,
                      decoration: InputDecoration(border: InputBorder.none),
                      style: fieldStyle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _dropDown(
      {required BuildContext context,
      required List<String> items,
      required String field}) {
    var dropdownValue;
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(field, style: titleStyle),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: iceberg,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: const Icon(Icons.keyboard_arrow_down_sharp),
                  ),
                  iconSize: 28,
                  iconEnabledColor: Color(0xFF001D4A),
                  elevation: 16,
                  style: fieldStyle,
                  hint: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text('Select', style: fieldStyle),
                  ),
                  value: dropdownValue,
                  isDense: true,
                  onChanged: (newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _addBanner({required String field, required String displayPicture}) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 1,
          child: Text(
            field,
            style: titleStyle,
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                    width: 135,
                    height: 135,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: iceberg,
                        image: DecorationImage(
                            image: AssetImage(displayPicture),
                            fit: BoxFit.cover))),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
