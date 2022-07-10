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
                listtileWidget(
                  context,
                  name: 'Tus pedidos',
                  destination: 'error',
                ),
                listtileWidget(
                  context,
                  name: 'Recomprar',
                  destination: 'error',
                ),

                const Divider(
                  height: 25,
                ),
                //Servicio al cliente
                textWidget('Servicio al cliente'),
                listtileWidget(
                  context,
                  name: 'Contáctanos',
                  destination: '/error',
                ),
                listtileWidget(
                  context,
                  name: 'Validar IMEI',
                  destination: '/check-imei',
                ),
                Divider(
                  height: 25,
                ),
                //Configuración de la cuenta
                textWidget('Configuración de la cuenta'),
                listtileWidget(
                  context,
                  name: 'Direcciones de envío',
                  destination: '/error',
                ),
                listtileWidget(context,
                    name: 'Cambiar a cuenta corporativa',
                    destination: '/serror'),
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

Card listtileWidget(BuildContext context,
    {required String name, required String? destination}) {
  return Card(
    elevation: 0,
    child: ListTile(
      onTap: () {
        Navigator.pushNamed(context, destination!);
      },
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
