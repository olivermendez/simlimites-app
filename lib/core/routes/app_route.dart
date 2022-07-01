import 'package:flutter/material.dart';
import '../../presentation/pages/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    // ignore: avoid_print
    print('This is route ${settings.name}');

    switch (settings.name) {
      case SplashScreen.routeName:
        return SplashScreen.route();
      case WelcomePage.routeName:
        return WelcomePage.route();
      case HomePage.routeName:
        return HomePage.route();
      case AccountPage.routeName:
        return AccountPage.route();
      case MySimPage.routeName:
        return MySimPage.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Error Page",
                ),
              ),
            ));
  }
}
