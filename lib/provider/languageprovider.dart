import 'package:flutter/material.dart';


class ChangeLanguageProvider extends ChangeNotifier{

  Locale? _locale1;


  Locale? get local => _locale1;

  void setLocale(String locale)
  {
    _locale1 = Locale(locale);
    notifyListeners();
  }

}