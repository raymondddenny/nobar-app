import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nobar_app/utils/utils.dart';

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> saveDataToFirebase(
      {required BuildContext context, required String name, required String joinCode}) async {
    try {
      final user = await _firestore.collection('users').add({
        'name': name,
        'joinCode': joinCode,
      });

      // update the user id
      await _firestore.collection('users').doc(user.id).update({
        'uid': user.id,
      });

      return true;
    } on FirebaseException catch (e) {
      showSnackBar(context: context, text: e.message ?? "");
      return false;
    }
  }
}
