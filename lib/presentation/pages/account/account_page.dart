import 'package:flutter/material.dart';
import 'package:simlimites/presentation/pages/home/home_page.dart';

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
    return Scaffold(
        appBar: customAppBarMiCuenta(),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Pedidos
                textWidget('Pedidos'),
                listtileWidget('Tus pedidos'),
                listtileWidget('Recomprar'),
                listtileWidget('Tus pedidos'),
                listtileWidget('Tus pedidos'),
                listtileWidget('Tus pedidos'),
                Divider(
                  height: 25,
                ),
                //Servicio al cliente
                textWidget('Servicio al cliente'),
                listtileWidget('Contáctanos'),
                Divider(
                  height: 25,
                ),
                //Configuración de la cuenta
                textWidget('Configuración de la cuenta'),
                listtileWidget('Direcciones de envío'),
                listtileWidget('Cambiar a cuenta corporativa'),
              ],
            )
          ],
        ));
  }
}

Padding textWidget(String name) {
  return Padding(
    padding: const EdgeInsets.only(left: 18.0, top: 10),
    child: Text(
      name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
    ),
  );
}

Card listtileWidget(String name) {
  return Card(
    elevation: 0,
    child: ListTile(
      onTap: () {},
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.w300),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      trailing: const Icon(
        Icons.navigate_next_outlined,
        color: Colors.black,
      ),
    ),
  );
}

AppBar customAppBarMiCuenta() {
  return AppBar(
    title: const Text("Mi cuenta"),
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
