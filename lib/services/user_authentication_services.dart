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
          .then(
        (value) async {
          await UserDatabaseServices().addUser(user);
        },
      );
    }on Exception catch (_) {
      rethrow;
    }
  }
 Future<bool> checkLogin() async {
  try {
    User? user= _auth.currentUser;
    if(user==null)
    {
      return false;
    }
    else
    {
      return true;
    }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  Future<void> signInWithMailandPass(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
