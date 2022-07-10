import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/routes/app_route.dart';
import 'presentation/pages/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(textTheme: GoogleFonts.quicksandTextTheme()),
      //theme: ThemeData.dark(),
      title: 'Sim limites',
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomePage.routeName,
      //home: SplashScreen(),
    );
  }
}
