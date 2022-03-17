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
      appBar: const CustomAppBar(title: 'My esim'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network(
            'https://assets6.lottiefiles.com/packages/lf20_hMl7FE.json',
          ),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Center(
                child: Text(
              'No tienes ningùn servicio',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
          ),
        ],

        //bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }
}
