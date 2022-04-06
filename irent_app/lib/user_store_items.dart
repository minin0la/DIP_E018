import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irent_app/admin/admin_constants.dart';
import 'package:irent_app/admin/admin_edit_item.dart';
import 'package:irent_app/topup.dart';
import 'package:intl/intl.dart';
import 'package:irent_app/database.dart';
import 'package:irent_app/user_item_page.dart';
import 'package:irent_app/app_icons.dart';
import 'package:irent_app/CategoriesScroller.dart';
import 'user_home.dart';

class UserStoreItemsPage extends StatelessWidget {
  final Color white = const Color(0xFFFBFBFF);
  final Color oxford = const Color(0xFF001D4A);
  final Color indigo = const Color(0xFF27476E);
  final Color aliceblue = const Color(0xFF81A4CD);
  final Color iceberg = const Color(0xFFDBE4EE);
  final Color marigold = const Color(0xFFECA400);
  final Color transparent = const Color(0x4DE3E3E3);

  final StoreDataModel storeDataModel;
  UserStoreItemsPage({Key? key, required this.storeDataModel})
      : super(key: key);

  @override
  bool closeTopContainer = false;

  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;

    final double itemHeight = 100;
    final double itemWidth = 120;

    final List itemCat = storeDataModel.itemCategories[0];
    final List items = storeDataModel.items[0];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          storeDataModel.storeName,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: oxford,
              fontFamily: 'SF_Pro_Rounded',
              fontSize: 25,
              fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: _wallet(context: context)),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          height: 37,
                          decoration: BoxDecoration(
                            color: iceberg,
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Icon(
                                  Icons.search,
                                  color: Color(0x80001D4A),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 10, bottom: 10, right: 10),
                                child: Text('Search for Items',
                                    style: TextStyle(
                                        color: Color(0x80001D4A),
                                        fontFamily: 'SF_Pro_Rounded',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 55,
              child: Expanded(
                flex: 4,
                child: Container(
                  width: 126,
                  height: 35,
                  margin: EdgeInsets.only(left: 30.0, top: 10.0, bottom: 20),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Categories',
                      style: TextStyle(
                          color: oxford,
                          fontFamily: 'SF Pro Rounded',
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child:
                        _addCategories(context: context, category: itemCat))),
            Expanded(
              flex: 9,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child:
                      _productDetailsCard(context: context, itemList: items)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addCategories(
      {required BuildContext context, required List category}) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: category.length,
        itemBuilder: (context, index) {
          for (var cat in category) {
            return Padding(
              padding: EdgeInsets.only(right: 12, bottom: 2, top: 2),
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: Container(
                          decoration: BoxDecoration(
                              // ignore: prefer_const_literals_to_create_immutables
                              boxShadow: [
                                const BoxShadow(
                                    color: Color(0x3327214D),
                                    offset: Offset(2, 3),
                                    blurRadius: 7)
                              ],
                              color: white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(16.0),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(category[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'SF Pro Rounded',
                                      color: oxford,
                                      fontWeight: FontWeight.w500,
                                      height: 1,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          throw 'No Data Found';
        });
  }

  Widget _productDetailsCard(
      {required BuildContext context, required List itemList}) {
    final List<ItemDataModel> itemListData = List.generate(
        itemList.length,
        (index) => ItemDataModel(
              storeDataModel.itemCategories,
              '${itemList[index]['id']}',
              '${itemList[index]['name']}',
              '${itemList[index]['product_category']}',
              '${itemList[index]['pricePerhour']}',
              '${itemList[index]['quantity']}',
              '${itemList[index]['displayPicture']}',
            ));
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GridView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: itemList.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            for (var item in itemListData) {
              return Stack(children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => user_item_page(
                                      itemDataModel: itemListData[index])));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image:
                                  AssetImage(itemList[index]['displayPicture']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ))),
              ]);
            }
            throw 'No Data Found';
          }),
    );
  }

  Widget _addCategoryDialog({required BuildContext context}) {
    return Dialog(
      alignment: Alignment.center,
      backgroundColor: iceberg,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 16,
      child: Container(
        height: 190,
        width: 275,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text(
                'Add Category',
                style: TextStyle(
                    color: oxford,
                    fontFamily: 'SF_Pro_Rounded',
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Container(
                    height: 35,
                    width: 215,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: white)),
                          focusedBorder: InputBorder.none,
                          hintText: 'Category Name',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            color: oxford,
                            fontFamily: 'SF_Pro_Rounded',
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 5,
                          primary: white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(38))),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: 100,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Add',
                        style: TextStyle(
                            color: white,
                            fontFamily: 'SF_Pro_Rounded',
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 5,
                          primary: indigo,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(38))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _wallet({required BuildContext context}) {
    var formatter = NumberFormat("#,##0.00", "en_US");
    return Stack(children: [
      Container(
          height: 82,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(129, 164, 205, 1),
          )),
      Positioned(
        left: 10,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Text.rich(TextSpan(children: <InlineSpan>[
            WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Icon(
                  AppIcons.wallet,
                  color: const Color(0xFFFBFBFF),
                  size: 25,
                )),
            TextSpan(
                text: '  Wallet',
                style: TextStyle(
                    color: const Color(0xFFFBFBFF),
                    fontFamily: 'SF_Pro_Rounded',
                    fontSize: 20,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w500)),
          ])),
        ),
      ),
      Positioned(
          left: 10,
          top: 35,
          child: Container(
            height: 28.25,
            width: 126,
            //color: Colors.black,
            child: FutureBuilder(
              future: getUserInfo(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData && snapshot.data!.exists) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "\$" + formatter.format(data['wallet']),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(251, 251, 255, 1),
                          fontFamily: 'SF Pro Rounded',
                          fontSize: 25,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    );
                  }
                } else if (snapshot.hasError) {
                  return Text('no data');
                }
                return CircularProgressIndicator();
              },
            ),
          )),
      Positioned(
          left: 240,
          top: 25,
          child: InkWell(
            child: Container(
              width: 66,
              height: 29,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromRGBO(39, 71, 110, 1),
              ),
              alignment: Alignment.center,
              child: Text(
                'Top Up',
                style: TextStyle(
                  color: Color.fromRGBO(251, 251, 255, 1),
                  fontFamily: 'SF Pro Rounded',
                  fontSize: 12,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TopUpPage()),
              );
            },
          )),
    ]);
  }
}

class ItemDataModel {
  final List itemCategories;
  final String id,
      name,
      productCategory,
      pricePerHour,
      quantity,
      displayPicture;

  ItemDataModel(this.itemCategories, this.id, this.name, this.productCategory,
      this.pricePerHour, this.quantity, this.displayPicture);
}
