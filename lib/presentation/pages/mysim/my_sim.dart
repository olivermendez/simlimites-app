import 'package:flutter/material.dart';

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
      appBar: CustomAppBar(
        title: 'MySimPage',
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
