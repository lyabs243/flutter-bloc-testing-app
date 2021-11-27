import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure/logic/states/settings_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class SettingsCubit extends Cubit<SettingsState> with HydratedMixin {

  SettingsCubit() : super(SettingsState());

  setDarkMode(bool _isDark) {
    emit(SettingsState(isDarkMode: _isDark, language: state.language));
  }

  setLanguage(String _language) {
    emit(SettingsState(isDarkMode: state.isDarkMode, language: _language));
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return state.toMap();
  }

}