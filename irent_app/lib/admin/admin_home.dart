import 'package:flutter/material.dart';
import 'package:irent_app/admin/admin_constants.dart';
import 'package:irent_app/user_store_uroc.dart';
import 'package:irent_app/admin/admin_add_store.dart';
import 'dart:ui';
import '../app_icons.dart';
import 'package:irent_app/admin/admin_add_store.dart';
import 'admin_store_items.dart';

class admin_home extends StatefulWidget {
  const admin_home({Key? key}) : super(key: key);

  @override
  _admin_homeState createState() => _admin_homeState();
}

class _admin_homeState extends State<admin_home> {
  final Color white = const Color(0xFFFBFBFF);
  final Color oxford = const Color(0xFF001D4A);
  final Color aliceblue = const Color(0xFF81A4CD);
  final Color iceberg = const Color(0xFFDBE4EE);
  final Color marigold = const Color(0xFFECA400);
  final Color transparent = const Color(0x4DE3E3E3);

  final List<StoreDataModel> storeData = List.generate(
      userFeedbackData.length,
      (index) => StoreDataModel(
            '${stores[index]['storeName']}',
            '${stores[index]['storeAddress']}',
            '${stores[index]['category']}',
            '${stores[index]['storeBanner']}',
            {stores[index]['itemCategories']}.toList(),
            {stores[index]['items']}.toList(),
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: marigold,
              heroTag: 'add_store',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddStorePage()));
              },
              child: Icon(
                Icons.add,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsetsDirectional.only(start: 35),
              child: Column(children: [
                Container(
                  height: 35,
                  width: 126,
                  //color: Colors.blue,
                  margin: EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Stores',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(0, 29, 74, 1),
                      fontFamily: 'SF Pro Rounded',
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Expanded(
            flex: 18,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(left: 35, right: 35),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: stores.length,
                    itemBuilder: (context, index) {
                      for (var item in stores) {
                        return _storeCard(
                            index: index,
                            storeName: storeData[index].storeName,
                            storeAddress: storeData[index].storeAddress,
                            category: storeData[index].category,
                            storeBanner: storeData[index].storeBanner);
                      }
                      throw 'No Data Found';
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _storeCard({
    required index,
    required storeName,
    required storeAddress,
    required category,
    required storeBanner,
  }) {
    const TextStyle titleStyle = TextStyle(
        color: Color(0xFFFBFBFF),
        fontFamily: 'SF Pro Rounded',
        fontSize: 17,
        letterSpacing: 0,
        fontWeight: FontWeight.w700);

    const TextStyle subtitleStyle = TextStyle(
        color: Color(0xFFFBFBFF),
        fontFamily: 'SF Pro Rounded',
        fontSize: 12,
        letterSpacing:
            0 /*percentages not used in flutter. defaulting to zero*/,
        fontWeight: FontWeight.w600);

    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          child: Column(
            children: [
              Container(
                height: 20,
                width: 264,
                margin: EdgeInsets.only(top: 22),
                child: Text(storeName,
                    textAlign: TextAlign.left, style: titleStyle),
              ),
              Container(
                height: 42,
                width: 266,
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  storeAddress,
                  textAlign: TextAlign.left,
                  style: subtitleStyle,
                ),
              ),
              Container(
                height: 14,
                width: 266,
                margin: EdgeInsets.only(top: 24),
                child: Text(
                  'Category: $category',
                  textAlign: TextAlign.left,
                  style: subtitleStyle,
                ),
              ),
            ],
          ),
          height: 150,
          width: 317,
          margin: EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 29, 74, 0.6000000238418579),
                    offset: Offset(0, 4),
                    blurRadius: 4),
              ],
              borderRadius: BorderRadius.circular(10),
              image: new DecorationImage(
                image: AssetImage(storeBanner),
                colorFilter: new ColorFilter.mode(
                    Color.fromRGBO(0, 29, 74, 0.6000000238418579),
                    BlendMode.hardLight),
                fit: BoxFit.cover,
              )),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  AdminStoreItemsPage(storeDataModel: storeData[index])),
        );
      },
    );
  }
}

class StoreDataModel {
  final String storeName, storeAddress, category, storeBanner;
  final List itemCategories, items;

  StoreDataModel(this.storeName, this.storeAddress, this.category,
      this.storeBanner, this.itemCategories, this.items);
}
