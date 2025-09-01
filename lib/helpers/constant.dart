import 'package:flutter/material.dart';

const ANDROID_KHAN_BANK = "https://play.google.com/store/apps/details?id=mn.slide.khaanbank";
const ANDROID_TDB_BANK = "https://play.google.com/store/apps/details?id=mongolia.grapecity.tdb";
const ANDROID_STATE_BANK = "https://play.google.com/store/apps/details?id=mn.statebank.mobilebank";
const ANDROID_KHAS_BANK = "https://play.google.com/store/apps/details?id=mn.xacbank.smartbank";
const ANDROID_MOST_MONEY = "https://play.google.com/store/apps/details?id=Cust.Menu";
const ANDROID_UBC_BANK = "https://play.google.com/store/apps/details?id=mn.ubcbank.smartbank";
const ANDROID_NI_BANK = "https://play.google.com/store/apps/details?id=mn.nibank.mobilebank";
const ANDROID_CK_BANK = "https://play.google.com/store/apps/details?id=mn.ckbank.smartbank2";

const ANDROID_CAPITRON_BANK = "https://play.google.com/store/apps/details?id=mn.ecapitron";
const ANDROID_BOGD_BANK = "https://play.google.com/store/apps/details?id=com.bogdbank.ebank.v2";

const ANDROID_CANDYPAY = "";
const ANDROID_QPAY_WALLET = "https://play.google.com/store/apps/details?id=mn.qpay.wallet&hl=en&gl=US";

const IOS_KHAN_BANK = "https://apps.apple.com/us/app/khan-bank/id610317572";
const IOS_TDB = "https://itunes.apple.com/us/app/tdb/id663172465";
const IOS_KHAS_BANK = "https://itunes.apple.com/mn/app/xacbank/id781439021";
const IOS_MOST_MONEY = "https://itunes.apple.com/us/app/mostmoney/id487144325";
const IOS_STATE_BANK = "https://itunes.apple.com/us/app/state-bank/id703343972";
const IOS_UBC_BANK = "https://itunes.apple.com/mn/app/ub-city-bank/id775671860";
const IOS_NI_BANK = "https://itunes.apple.com/mn/app/nibank/id882075781";
const IOS_CK_BANK = "https://itunes.apple.com/us/app/smartbank-ckbank/id1180620714";

const IOS_CAPITRON_BANK = "https://apps.apple.com/us/app/capitron-bank/id1312706504";
const IOS_BOGD_BANK = "https://apps.apple.com/us/app/bogd-mobile/id1475442374";
const IOS_QPAY_WALLET = "https://apps.apple.com/us/app/qpay-wallet/id1501873159";

class Constants {
  static const storageKey = 'ZEELY_';

  static const platform = 'platform';
  static const rememberMe = 'remember_me';
  static const deviceId = 'device_id';
  static const DeviceBiometricType = 'device_biometric_type';
}

class DeviceBiometricType {
  static const none = 0;
  static const TouchId = 1;
  static const faceId = 2;
}

class ChallengeStatus {
  static const Ongoing = 'Ongoing';
  static const StartSoon = 'StartSoon';
  static const Closed = 'Closed';
  static const MyOngoing = 'MyOngoing';
}

class NavigationKey {
  static final navKey = GlobalKey<NavigatorState>();
}

class NotifRouteType {
  static const Habit = "Habit";
  static const Content = "Content";
  static const PsyTest = "PsyTest";
  static const Challenge = "Challenge";
  static const MoodTracking = "MoodTracking";
  static const NewVersion = "NewVersion";
  static const Subscription = "Subscription";
  static const Feedback = "Feedback";
  static const HabitExecution = "HabitPlan";
  static const ChallengeExecution = "ChallengePlan";
  static const HabitPlans = "HabitPlans";
  static const Voucher = "Voucher";
}

class InappType {
  static const Image = "Image";
  static const ImageWithRoute = "ImageWithRoute";
  static const TitleWithBody = "TitleWithBody";
  static const TitleWithBodyRoute = "TitleWithBodyRoute";
  static const Question = "Question";
  static const Full = "Full";
}

class VoucherType {
  static const Code = "Code";
  static const Barcode = "Barcode";
  static const Qrcode = "Qrcode";
}
