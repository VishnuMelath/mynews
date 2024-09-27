import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfigServices {
  final remoteConfig = FirebaseRemoteConfig.instance;

  Future<String> loadCountryCode()async
  {
    String countryCode='';
     try {
   
      
      await remoteConfig.setDefaults({'country_code': 'US'});
      await remoteConfig.fetchAndActivate();
      countryCode = remoteConfig.getString('country_code');
  return countryCode;
    } catch (e) {
      rethrow;
    }
  }

}