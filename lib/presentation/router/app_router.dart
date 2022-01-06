import 'package:flutter/material.dart';
import 'package:flutter_structure/utils/constants.dart';
import 'package:flutter_structure/presentation/screens/home/home.dart';
import 'package:flutter_structure/presentation/screens/settings_page/settings_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PAGE_HOME:
        return MaterialPageRoute(
          builder: (_) => HomePage()
        );
      case PAGE_SETTINGS:
        return MaterialPageRoute(
          builder: (_) => SettingsPage()
        );
      default:
        return null;
    }
  }
}