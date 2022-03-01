// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemImageTester extends StatefulWidget {
  const ItemImageTester({Key? key}) : super(key: key);

  @override
  _ItemImageTesterState createState() => _ItemImageTesterState();
}

class _ItemImageTesterState extends State<ItemImageTester> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: null,
        body: Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          width: double.infinity,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('items').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return GridView.count(
                crossAxisCount: 2,
                children: snapshot.data!.docs.map((document) {
                  return Center(
                    child: Container(
                        child: Image.network(document['isBooked'] == false
                            ? document['itemImageUrl']
                            : null)),
                    // right now if you go to firebase and change the isBooked on item to false,
                    // the image shows. If change to isBooked = true, then it shows null error
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
