import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simlimites/presentation/widgets/widgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 2),
        () => MaterialPageRoute(
            builder: (context) => const CustomNavigationBar()));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image(image: AssetImage('assets/Imagotipo.png')),
            ),
          ),
        ],
      ),
    );
  }
}
