import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<DocumentSnapshot> getUserInfo() async {
  String? uid = FirebaseAuth.instance.currentUser?.uid;
  return await FirebaseFirestore.instance.collection("users").doc(uid).get();
}
