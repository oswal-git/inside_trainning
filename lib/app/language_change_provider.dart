import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class LanguageChangeProvider with ChangeNotifier {
  Locale _currentLocale = const Locale('es');

  Locale get currentLocale => _currentLocale;

  void changeLocale(String locale) {
    Logger.root.info('Local: $locale.');
    _currentLocale = Locale(locale);
    notifyListeners();
  }
}
