import 'package:flutter/material.dart';
import '../presentation/pages/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route ${settings.name}');

    switch (settings.name) {
      case '/welcome':
        return WelcomePage.route();
      case HomePage.routeName:
        return HomePage.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text("Error Page")),
            ));
  }
}
