

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NinghaoDemoLocalizations {

  final Locale locale;

  NinghaoDemoLocalizations({
    this.locale
  });

  static Map<String, Map<String, String>> _localized = {
    'en': {
      'title': 'hello',
    },
    'zh': {
      'title': '您好',
    }
  };

  String get title {
    return _localized[locale.languageCode]['title'];
  }
}

class NinghaoDemoLocalizationsDelegate extends LocalizationsDelegate<NinghaoDemoLocalizations> {
  NinghaoDemoLocalizationsDelegate();

  @override
  Future<NinghaoDemoLocalizations> load(Locale locale) {
    return SynchronousFuture<NinghaoDemoLocalizations>(NinghaoDemoLocalizations(locale: locale));
  }

  @override
  bool isSupported(Locale locale) {

    return true;
  }

  @override
  bool shouldReload(LocalizationsDelegate<NinghaoDemoLocalizations> old) {
    return false;
  }
}