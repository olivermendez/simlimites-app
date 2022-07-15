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
      appBar: normalAppBar('My Sim'),
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
