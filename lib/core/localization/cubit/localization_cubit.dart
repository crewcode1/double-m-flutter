import 'package:doublem/core/localization/app_localizations.dart';
import 'package:doublem/core/utils/implementation/cache_utils.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  late String _language;
  LocalizationCubit() : super(LocalizationInit()) {
    _language = _getLanguage();
    emit(LocalizationChange(Locale(_language)));
  }
  String get language => _language;

  static LocalizationCubit get(BuildContext context) =>
      BlocProvider.of<LocalizationCubit>(context);
  void changeLanguage(String locale) {
    if (locale == _language) {
    } else {
      // _language = locale;
      switch (locale) {
        case 'ar':
          changeLanguageToArabic();
        case 'en':
          changeLanguageToEnglish();

        default:
      }
    }
  }

  void changeLanguageToArabic() {
    // locale = 'ar';
    _language = 'ar';
    _changeLanguage(_language);
    // CacheUtils().setString('language', 'ar');
    emit(LocalizationChange(AppLocalizations.supportedLocales.first));
  }

  void changeLanguageToEnglish() {
    _language = 'en';
    // locale = 'en';
    _changeLanguage(_language);
    // CacheUtils().setString('language', 'en');
    emit(LocalizationChange(AppLocalizations.supportedLocales.last));
  }

  String _getLanguage() {
    String locale = CacheUtils().getString(key: 'language') ?? 'ar';
    return locale;
  }

  void _changeLanguage(String locale) {
    CacheUtils().setString(key: 'language', value: locale);
  }
}
