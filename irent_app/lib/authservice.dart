import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final currentUser = FirebaseAuth.instance.currentUser;

  Future<String> changeProfile(name, email) async {
    try {
      await currentUser!.updateDisplayName(name);
      await currentUser!.updateEmail(email);
      // await currentUser!.updatePhoneNumber(mobileNum); For future expansion
      return "success";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> changePassword(newPassword) async {
    try {
      await currentUser!.updatePassword(newPassword);
    } on FirebaseAuthException catch (error) {
      return error.code;
    }
    return "success";
  }
}
