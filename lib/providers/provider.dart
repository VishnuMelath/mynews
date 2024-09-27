// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:mynews/models/news_model.dart';
import 'package:mynews/models/user_model.dart';
import 'package:mynews/services/firebase_remote_config_services.dart';
import 'package:mynews/services/news_api_services.dart';
import 'package:mynews/services/user_authentication_services.dart';
import 'package:mynews/utils/animated_routing.dart';
import 'package:mynews/utils/network_check.dart';
import 'package:mynews/views/home_screen.dart';
import 'package:mynews/views/widgets/custom_alertdialogu.dart';
import 'package:mynews/views/widgets/custom_snackbar.dart';

class UserProvider extends ChangeNotifier {
  bool isloading = false;
  bool haveError = false;
  bool loggedIn = false;
  String country_code = 'US';
  String errorMsg = '';
  List<NewsDataModel> news = [];

  Future signUp(UserModel user, String password, BuildContext context) async {
    try {
      isloading = true;
      notifyListeners();
      await UserAuthenticationServices().signUp(user, password);
      isloading = false;
      notifyListeners();
      showSuccessSnackBar(context, 'Succesfully registered');
      Navigator.pushReplacement(context, customRoute(const HomeScreen()));
    } on FirebaseException catch (e) {
      log(e.code);
      errorMsg = e.message!;
      isloading = false;
      notifyListeners();
      showErrorSnackBar(context, e.code);
    }
  }

  Future login(String email, String password, BuildContext context) async {
    try {
      isloading = true;
      notifyListeners();
      await UserAuthenticationServices().signInWithMailandPass(email, password);
      isloading = false;
      notifyListeners();
      Navigator.pushReplacement(context, customRoute(const HomeScreen()));
    } on FirebaseException catch (e) {
      errorMsg = e.code;
      isloading = false;
      notifyListeners();
      showErrorSnackBar(context, 'invalid creditials');
    }
  }

  Future getAllNews(BuildContext context) async {
    try {
      isloading = true;
      notifyListeners();
      news = await NewsApiServices().getAllNews(country_code);
      log('hello');
      isloading = false;
      notifyListeners();
    } catch (e) {
      isloading = false;
      notifyListeners();
      customAlertDialog(
        e.toString(),
        context,
        () {
          getAllNews(context);
        },
      );
    }
  }

  Future splashLoading(BuildContext context) async {
    try {
      if (!await hasNetwork()) {
        customAlertDialog(
          'Network not available',
          context,
          () {
            splashLoading(context);
          },
        );
      } else {
        isloading = true;
        notifyListeners();
        country_code = await FirebaseRemoteConfigServices().loadCountryCode();
        loggedIn = await UserAuthenticationServices().checkLogin();
      }
    } catch (e) {
      customAlertDialog(
        e.toString(),
        context,
        () {
          getAllNews(context);
        },
      );
    }
  }
}
