import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  static const String routeName = '/welcome';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const WelcomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
