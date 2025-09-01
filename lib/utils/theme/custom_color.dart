import 'package:flutter/material.dart';

CustomColors customColors = CustomColors.light();

class ColorCodes {
  static const primary = 'FA6C51';
  static const ghostGrey = 'CBD0D7';
  static const roseWhite = 'FFF7F6';
}

class ConstantColors {
  static const primaryNight = Color(0xff0E0E23); // primary night
  static const mainGohan = Color(0xffFFFFFF); // primary night
  static const suppBlue = Color(0xFF5D5FEC);
  static const loginBut = Color(0xff37376F);
  static const midText = Color(0xff878394);
  static const midagray = Color(0xffCECECE);
  static const defaultTertiary = Color(0xffB3B3B3);
  static const borderColor = Color(0xffF5F5F5);
  static const mainTrunks = Color(0xff595D62);
  static const gray = Color(0xffE2E2E2);
  static const mainBeerus = Color(0xffE2E2E2);
  static const defaultBackground = Color(0xff2C2C2C);
  static const primaryGreen = Color(0xff78E0A2);
  static const supportPurple = Color(0xffBEC8FF);
  static const secondText = Color(0xff757575);
}

class CustomColors {
  /// Auth colors
  Color primaryNight = ConstantColors.primaryNight;
  Color mainGohan = ConstantColors.mainGohan;
  Color suppBlue = ConstantColors.suppBlue;
  Color loginBut = ConstantColors.loginBut;
  Color midText = ConstantColors.midText;
  Color midagray = ConstantColors.midagray;
  Color defaultTertiary = ConstantColors.defaultTertiary;
  Color borderColor = ConstantColors.borderColor;
  Color mainTrunks = ConstantColors.mainTrunks;
  Color gray = ConstantColors.gray;
  Color mainBeerus = ConstantColors.mainBeerus;
  Color defaultBackground = ConstantColors.defaultBackground;
  Color primaryGreen = ConstantColors.primaryGreen;
  Color supportPurple = ConstantColors.supportPurple;
  Color secondText = ConstantColors.secondText;

  CustomColors.constructor();

  /// Light theme
  factory CustomColors.light() => CustomColors.constructor()
      // ..primary = ConstantColors.primary
      ;

  /// Dark theme
  factory CustomColors.dark() => CustomColors.light();
}

// Test habit colors
// #FBD277
// #46CEAC
// #F76C82
// #9ED26A
// #E3B692
// #EB86BE
// #9ED26A
// #9ED26A
// #9ED26A
