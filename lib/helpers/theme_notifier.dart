import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier with ChangeNotifier {
  bool _isDarkMode;
  static const String _themeKey = 'isDarkMode';

  static final List<ThemeData> themeData = [
    ThemeData(
      colorScheme: const ColorScheme.light(
        surface: Colors.white,
        onPrimaryContainer: Colors.white,
        primaryContainer: Colors.white,
        surfaceTint: Colors.white,
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: Color(0xff24ABF8).withValues(alpha: 0.5),
        cursorColor: Color(0xff24ABF8).withValues(alpha: 0.6),
        selectionHandleColor: Color(0xff24ABF8).withValues(alpha: 1),
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(color: Colors.black, fontSize: 12),
      ),
      brightness: Brightness.light,
      primaryColor: Color(0xffD7B590),
      shadowColor: Colors.black,
      hintColor: Color(0xFFF4F6F8),
    ),
    ThemeData(
      colorScheme: const ColorScheme.dark(
        surface: Colors.black,
        onPrimaryContainer: Colors.black,
        primaryContainer: Colors.black,
        surfaceTint: Colors.black,
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: Color(0xff24ABF8).withOpacity(.5),
        cursorColor: Color(0xff24ABF8).withOpacity(.6),
        selectionHandleColor: Color(0xff24ABF8).withOpacity(1),
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(color: Color(0xffD7B590), fontSize: 12),
      ),
      brightness: Brightness.dark,
      primaryColor: Colors.pink,
      shadowColor: Colors.black,
      hintColor: Color(0xFFF4F6F8),
    ),
  ];

  ThemeNotifier(this._isDarkMode) {
    _loadTheme();
  }

  bool get isDarkMode => _isDarkMode;

  ThemeData getTheme() => _isDarkMode ? themeData[1] : themeData[0];

  bool getThemeType() => _isDarkMode;

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool(_themeKey) ?? _isDarkMode;
    notifyListeners();
  }

  void setTheme(bool isDark) {
    if (_isDarkMode == isDark) return;
    _isDarkMode = isDark;
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(_themeKey, _isDarkMode);
    });
    notifyListeners();
  }
}

extension CustomColorScheme on ColorScheme {
  Color get black => brightness == Brightness.light ? const Color(0xFF000000) : const Color(0xFFFFFFFF);

  Color get mainWhite => brightness == Brightness.light ? const Color(0xFFFFFFFF) : const Color(0xFFFFFFFF);

  Color get customButtonColor => brightness == Brightness.light ? const Color(0xFF000000) : const Color(0xFF0B60D4);

  Color get customBackground => brightness == Brightness.light ? const Color(0xFFFFFFFF) : const Color(0xFFFFFFFF);

  Color get midGrayTextColor => brightness == Brightness.light ? const Color(0xFF6F6F6F) : const Color(0xFF6F6F6F);

  Color get softMidGray => brightness == Brightness.light ? const Color(0xFFE6E6E6) : const Color(0xFFE6E6E6);

  Color get mainBackground => brightness == Brightness.light ? const Color(0xFFF5F4F0) : const Color(0xFFF5F4F0);

  Color get softGray => brightness == Brightness.light ? const Color(0xFFCDCDCD) : const Color(0xFFCDCDCD);

  Color get geniPurple => brightness == Brightness.light ? const Color(0xFFCA7FFE) : const Color(0xFFCA7FFE);

  Color get geniBlue => brightness == Brightness.light ? const Color(0xFF4D55F5) : const Color(0xFF4D55F5);

  Color get geniGreen => brightness == Brightness.light ? const Color(0xFF4FB755) : const Color(0xFF4FB755);

  Color get mainDark => brightness == Brightness.light ? const Color(0xFF2D262D) : const Color(0xFF2D262D);

  Color get greenShadowColor => brightness == Brightness.light ? const Color(0xFF086C17) : const Color(0xFF086C17);

  Color get geniOrange => brightness == Brightness.light ? const Color(0xFFE98966) : const Color(0xFFE98966);

  Color get red => brightness == Brightness.light ? const Color(0xFFDD2B1F) : const Color(0xFFDD2B1F);

  Color get midGray => brightness == Brightness.light ? const Color(0xFF6F6F6F) : const Color(0xFF6F6F6F);

  Color get prodTextColor => brightness == Brightness.light ? const Color(0xFF2D262D) : const Color(0xFF2D262D);

  Color get profileColor => brightness == Brightness.light ? const Color(0xFFD9D9D9) : const Color(0xFFD9D9D9);

  Color get yellow => brightness == Brightness.light ? const Color(0xFFF49D19) : const Color(0xFFF49D19);
}
