import 'package:flutter/material.dart';
import 'package:scope_demo/model/language.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServicesProvider extends ChangeNotifier {
  Locale _appLocale = Locale('ar');

  Locale get appLocal => _appLocale ?? Locale("en");

  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = Locale('ar');
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code'));
    return Null;
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == Locale("ar")) {
      _appLocale = Locale("ar");
      await prefs.setString('language_code', 'ar');
      await prefs.setString('countryCode', 'AR');
    } else if (type == Locale("en")) {
      _appLocale = Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    } else if (type == Locale("es")) {
      _appLocale = Locale("es");
      await prefs.setString('language_code', 'es');
      await prefs.setString('countryCode', 'ES');
    } else if (type == Locale("hi")) {
      _appLocale = Locale("hi");
      await prefs.setString('language_code', 'hi');
      await prefs.setString('countryCode', 'IN');
    } else if (type == Locale("ml")) {
      _appLocale = Locale("ml");
      await prefs.setString('language_code', 'ml');
      await prefs.setString('countryCode', 'IN');
    } else if (type == Locale("zh")) {
      _appLocale = Locale("zh");
      await prefs.setString('language_code', 'zh');
      await prefs.setString('countryCode', 'CN');
    } else {
      _appLocale = Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    }
    notifyListeners();
  }

  List<Language> _languages = [
    Language(
      "ar",
      "Arabic",
      "العربية",
      "assets/images/united-arab-emirates.png",
    ),
    Language(
      "en",
      "English",
      "English",
      "assets/images/united-states-of-america.png",
      selected: true,
    ),
    new Language(
      "es",
      "Spanish",
      "Spana",
      "assets/images/spain.png",
    ),
    new Language(
      "hi",
      "Hindi",
      "Hindi",
      "assets/images/hindi.png",
    ),
    new Language(
      "ml",
      "Malayalam",
      "Malayalam",
      "assets/images/malayalam.png",
    ),
    new Language(
      "zh",
      "China",
      "China",
      "assets/images/china.png",
    ),
  ];

  List<Language> get languages => _languages;
}
