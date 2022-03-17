import 'package:flutter/material.dart';
import 'package:simlimites/core/app_route.dart';
import 'presentation/pages/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Sim limites',
      //onGenerateRoute: AppRouter.onGenerateRoute,
      //initialRoute: HomePage.routeName,
      home: HomePage(),
    );
  }
}
