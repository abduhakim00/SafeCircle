import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";

class UserData with ChangeNotifier {
  DocumentSnapshot userInfo;

  UserData() {
    updateUserInfo();
  }

  void updateUserInfo() async {
    userInfo = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();
  }

  DocumentSnapshot getData() {
    return userInfo;
  }

  String getUserName() {
    return userInfo.data()['username'];
  }
}
