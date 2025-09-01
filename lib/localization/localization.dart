import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_habido_v2/localization/localization_helper.dart';

class LocaleKeys {
  static LocaleKeys? of(BuildContext context) {
    return Localizations.of<LocaleKeys>(context, LocaleKeys);
  }

  ///
  /// Global
  ///
  static String longText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis gravida nibh ac ultrices suscipit. Phasellus vel venenatis mauris. Praesent bibendum sed nulla nec imperdiet. Suspendisse potenti. Mauris ullamcorper purus eget velit condimentum, ut cursus ex vehicula. Sed tellus ex, suscipit nec dapibus sed, gravida quis mauris. Sed iaculis odio mi, ut maximus nibh pharetra a. Nunc et maximus orci. Donec eget semper sapien, nec ultricies magna. Maecenas semper feugiat nisi eget bibendum. Pellentesque sed turpis ullamcorper, malesuada justo ut, porta lectus. Integer tristique massa enim. Nam lacinia tempor nibh ac posuere.';

  static const String obscureChar = '*';

  static const String placeHolder = '[placeHolder]';

  static String get appName => 'HabiDo';

  static const String register = 'Бүртгүүлэх';

  static const String registerDesc = 'Бүртгүүлэхдээ та өөрийн утасны дугаар болон Google, Apple платформууд сонголтоо хийнэ бүртгүүлээрэй.';

  static const String registrationSection = 'Бүртгүүлэх хэсэг';

  static const String registerPhoneNumber = 'Утасны дугаараар бүртгүүлэх';

  static const String registerGoogle = 'Google-ээр бүртгүүлэх';

  static const String registerApple = 'Apple-аар бүртгүүлэх';

  static const String login = 'Нэвтрэх';

  static String get noData => 'Мэдээлэл олдсонгүй';

  static String get errorOccurred => 'Алдаа гарлаа';

  static String get success => 'Амжилттай';

  static String get failed => 'Амжилтгүй';
}

class FlutterBlocLocalizationsDelegate extends LocalizationsDelegate<LocaleKeys> {
  @override
  Future<LocaleKeys> load(Locale locale) => Future(() => LocaleKeys());

  @override
  bool shouldReload(FlutterBlocLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) => locale.languageCode.toLowerCase().contains(LanguageCode.en);
}
