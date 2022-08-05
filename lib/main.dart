import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/routes/app_route.dart';
import 'presentation/pages/screens.dart';

//void main() => runApp(const MyApp());

void main() async {
  await dotenv.load();
  return runApp(const MyApp());
  //var x = dotenv.env['foo'];
  // ...
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.quicksandTextTheme()),
      title: 'Sim limites',
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomePage.routeName,
      //home: SplashScreen(),
    );
  }
}
