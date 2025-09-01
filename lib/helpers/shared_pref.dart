import 'dart:convert';

import 'package:mobile_habido_v2/utils/func.dart';
import 'package:mobile_habido_v2/utils/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPref;

class SharedPrefKey {
  static const String key = 'Habido';
  static const languageCode = '${key}language_code';

  static const String theme = 'theme';
  static const String introLimit = 'introLimit';

  /// Auth
  static const String phoneNumber = 'phoneNumber';
  static const String password = 'password';
  static const String rememberMe = 'rememberMe';
  static const String biometricAuth = 'biometricAuth';
  static const String sessionToken = 'sessionToken'; // Session token
  static const String authToken = 'authToken'; // oauth token

  static const String bioToken = 'bioToken';

  static const String deviceName = 'deviceName';
  static const String deviceId = 'deviceId';
  static const String wifiId = 'wifiIf';

  static const String firstName = 'firstName';

  static const String rememberAcc = 'rememberAcc';
  static const String bioType = 'biometricType';

  static const String imagePaths = 'imagePaths';

  static const String appVersion = 'appVersion';
  static const String otpExpireDate = '${key}otp_expire_date';
  static const String phoneNumber1 = '${key}phone_number';
  static const otpHistory = '${key}otp_history';

  /// Push notification
  static const String pushNotifToken = 'pushNotifToken'; // Google firebase push notification token
  static const String registeredPushNotifToken = 'registeredPushNotifToken'; // Өмнө нь server рүү бүртгүүлсэн эсэх
}

class OtpRecord {
  final String? phoneNo;
  final String? email;
  final String expireDate;

  OtpRecord({this.phoneNo, this.email, required this.expireDate})
      : assert(
          phoneNo != null || email != null,
        );

  Map<String, dynamic> toJson() => {
        'phoneNo': phoneNo,
        'email': email,
        'expireDate': expireDate,
      };

  factory OtpRecord.fromJson(Map<String, dynamic> json) => OtpRecord(
        phoneNo: json['phoneNo'],
        email: json['email'],
        expireDate: json['expireDate'],
      );
}

class SharedPref {
  static String getSessionToken() {
    //
    return sharedPref?.getString(SharedPrefKey.sessionToken) ?? '';
  }

  // static void setSessionToken(String? sessionToken) {
  //   sharedPref?.setString(SharedPrefKey.sessionToken, Func.toStr(sessionToken ?? ""));
  // }

  static String getAuthToken() {
    //
    return sharedPref?.getString(SharedPrefKey.authToken) ?? '';
  }

  // static void setAuthToken(String? authToken) {
  //   sharedPref?.setString(SharedPrefKey.authToken, Func.toStr(authToken ?? ""));
  // }

  static String getPushNotifToken() {
    return sharedPref?.getString(SharedPrefKey.pushNotifToken) ?? '';
  }

  static void setPushNotifToken(String? pushNotifToken) {
    sharedPref?.setString(SharedPrefKey.pushNotifToken, pushNotifToken ?? '');
  }

  static bool getRegisteredPushNotifToken() {
    if (Func.isNotEmpty(globals.userData?.phone)) {
      return sharedPref?.getBool(SharedPrefKey.registeredPushNotifToken + '_${globals.userData!.phone!}') ?? false;
    }

    return false;
  }

  static void setPushNotifTokenRegistered(bool value) {
    if (Func.isNotEmpty(globals.userData?.phone)) {
      sharedPref?.setBool(SharedPrefKey.registeredPushNotifToken + '_${globals.userData!.phone!}', value);
    }
  }

  static bool checkIntroLimit() {
    // sharedPref?.clear();

    // Intro 1 удаа харуулсан эсэхийг шалгана
    var res = (sharedPref?.getInt(SharedPrefKey.introLimit) ?? 0) < 1;

    // Intro харуулсан тоог ахиулах
    int introCount = sharedPref?.getInt(SharedPrefKey.introLimit) ?? 0;
    introCount++;
    sharedPref?.setInt(SharedPrefKey.introLimit, introCount);

    return res;
  }

  static Future<void> init() async {
    sharedPref = await SharedPreferences.getInstance();
  }
}
