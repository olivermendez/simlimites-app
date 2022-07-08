import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/widgets.dart';

class MySimPage extends StatelessWidget {
  const MySimPage({Key? key}) : super(key: key);

  static const String routeName = '/mysim';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const MySimPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarMyEsim('My Sim'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 140,
              width: 140,
              child: Lottie.network(
                'https://assets4.lottiefiles.com/packages/lf20_2gfeptkg.json',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
                child: Text(
              'No tienes ningún servicio',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            )),
          ),
        ],

        //bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }
}

AppBar customAppBarMyEsim(String name) {
  return AppBar(
    title: Text(name),
    centerTitle: true,
    elevation: 0,
    backgroundColor: const Color.fromARGB(255, 4, 45, 90),
    leading: Padding(
      child: Image.asset(
        'assets/imagotipo.png',
        scale: 1.0,
      ),
      padding: const EdgeInsets.only(left: 15),
    ),
  );
}
