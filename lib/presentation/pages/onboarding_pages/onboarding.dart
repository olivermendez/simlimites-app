import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simlimites/presentation/pages/onboarding_pages/onboard_data.dart';
import 'package:simlimites/presentation/widgets/widgets.dart';

import '../home/home_page.dart';
import '../login/login_page.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => SplashScreen(),
    );
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late PageController _pageController = PageController();

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  // ignore: must_call_super
  void dispose() {
    _pageController.dispose();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: onboard_data.length,
              controller: _pageController,
              itemBuilder: (context, index) => ScreensOnBoard(
                title: onboard_data[index].title,
                image: onboard_data[index].image,
                description: onboard_data[index].description,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _pageController.nextPage(
              curve: Curves.ease, duration: const Duration(milliseconds: 300));

          if (_pageController.page == onboard_data.length - 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
          }
        },
        child: const Icon(
          Icons.chevron_right,
        ),
      ),
    );
  }
}

class ScreensOnBoard extends StatelessWidget {
  const ScreensOnBoard({
    Key? key,
    required this.title,
    required this.image,
    required this.description,
  }) : super(key: key);

  final String title;
  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image(
                image: AssetImage(image),
              ),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          )
        ],
      ),
    );
  }
}
