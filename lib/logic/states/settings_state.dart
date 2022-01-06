import 'package:flutter_structure/utils/constants.dart';

class SettingsState {

  bool isDarkMode;
  String language;

  SettingsState({this.isDarkMode: false, this.language: LANG_CODE});

  Map<String, dynamic> toMap() {
    return {
      FIELD_IS_DARK_MODE: isDarkMode,
      FIELD_LANGUAGE: language,
    };
  }

  static SettingsState fromMap(Map<String, dynamic> map) {
    return SettingsState(isDarkMode: map[FIELD_IS_DARK_MODE], language: map[FIELD_LANGUAGE]);
  }

}