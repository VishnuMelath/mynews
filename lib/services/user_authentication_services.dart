import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mynews/models/user_model.dart';
import 'user_database_services.dart';

class UserAuthenticationServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUp(UserModel user, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: user.email, password: password)
          .then((value) {});
      await UserDatabaseServices().addUser(user);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
