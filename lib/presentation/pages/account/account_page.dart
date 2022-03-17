import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  static const String routeName = '/account';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const AccountPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("hola"),
      ),
    );
  }
}
