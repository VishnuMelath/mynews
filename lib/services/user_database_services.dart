
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynews/models/user_model.dart';

class UserDatabaseServices {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addUser(UserModel user) async {
    try {
      final userCollection = firestore.collection('user');
      await userCollection.doc(user.email).set(user.toJson());
    }  catch (e) {
      log(e.toString());
    }
  }
}
