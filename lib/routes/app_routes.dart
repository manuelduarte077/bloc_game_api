import 'package:bloc_api/utils/error_route.dart';
import 'package:bloc_api/view/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The Route is: ${settings.name}');

    switch (settings.name) {
      case '/':
        return LandingPage.route();
      case LandingPage.routeName:
        return LandingPage.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => const ErrorRoutes(),
    );
  }
}
