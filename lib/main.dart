import 'package:flutter/material.dart';
//import 'package:simlimites/core/app_route.dart';
import 'core/routes/app_route.dart';
import 'presentation/pages/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Sim limites',
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomePage.routeName,
      //home: SplashScreen(),
    );
  }
}
