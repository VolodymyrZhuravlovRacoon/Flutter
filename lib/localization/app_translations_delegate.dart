import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertestapp/localization/app_translations.dart';
import 'package:fluttertestapp/localization/application.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTranslationsDelegate extends LocalizationsDelegate<AppTranslations> {
  final Locale newLocale;

  const AppTranslationsDelegate({this.newLocale});

  @override
  bool isSupported(Locale locale) {
    saveTokens(locale.languageCode);
    return application.supportedLanguagesCodes.contains(locale.languageCode);
  }

  @override
  Future<AppTranslations> load(Locale locale) {
    return AppTranslations.load(newLocale ?? locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppTranslations> old) {
    return true;
  }
  saveTokens(String local) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("local", local);
  }
}