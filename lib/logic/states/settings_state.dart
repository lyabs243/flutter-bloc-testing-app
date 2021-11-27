import 'package:flutter_structure/constants/constants.dart';

class SettingsState {

  bool isDarkMode;

  SettingsState({this.isDarkMode: false});

  Map<String, dynamic> toMap() {
    return {
      FIELD_IS_DARK_MODE: isDarkMode,
    };
  }

  static SettingsState fromMap(Map<String, dynamic> map) {
    return SettingsState(isDarkMode: map[FIELD_IS_DARK_MODE]);
  }

}