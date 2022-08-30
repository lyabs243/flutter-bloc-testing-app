import 'package:flutter_structure/presentation/router/no_animation_route.dart';
import 'package:flutter_structure/presentation/screens/notification_page/notification_page.dart';
import 'package:flutter_structure/presentation/screens/settings_page/settings_page.dart';
import 'package:flutter_structure/utils/my_material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {

    Map<String, dynamic>? arguments = settings.arguments as Map<String, dynamic>?;
    Widget? page;

    switch (settings.name) {
      case pageHome:
        page = const HomePage();
        break;
      case pageSettings:
        page = const SettingsPage();
        break;
      case pageNotification:
        page = NotificationPage(message: arguments![argumentMessage]);
        break;
      default:
    }

    if (page != null) {

      if (arguments != null && (arguments[argumentIsNOAnimation]?? false)) {
        return NoAnimationMaterialPageRoute(builder: (_) => page!);
      }

      return MaterialPageRoute(builder: (_) => page!);
    }

    return null;
  }
}