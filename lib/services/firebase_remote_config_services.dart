import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfigServices {
  final remoteConfig = FirebaseRemoteConfig.instance;

  Future<String> loadCountryCode() async {
    String countryCode = '';
    try {
      await remoteConfig.fetchAndActivate();
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: const Duration(seconds: 10)));
      log(remoteConfig.getString('test'));
      countryCode = remoteConfig.getString('country_code');
      return countryCode;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
