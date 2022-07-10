import 'package:flutter/material.dart';

class CheckImeiPage extends StatefulWidget {
  CheckImeiPage({Key? key}) : super(key: key);

  static const String routeName = '/check-imei';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CheckImeiPage(),
    );
  }

  @override
  State<CheckImeiPage> createState() => _CheckImeiPageState();
}

class _CheckImeiPageState extends State<CheckImeiPage> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Validar Imei',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Indíca tú numero de imei aquí',
                ),
                controller: _controller,
                onSubmitted: (String value) async {
                  await showDialog<void>(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text('Validando... (no api connected)'),
                        content: const SizedBox(
                          height: 230,
                          child: CircularProgressIndicator(
                            semanticsValue: 'validando imei',
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
