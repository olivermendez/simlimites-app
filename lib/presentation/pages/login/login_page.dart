import 'package:flutter/material.dart';
//import 'package:simlimites/presentation/pages/home/home_page.dart';
//import 'package:simlimites/presentation/widgets/circle.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();
    //conocer la dimension de la pantalla actual
    //final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        children: [
          const SizedBox(
            height: 80.0,
          ),
          Column(
            children: const [
              Text("simlimites"),
            ],
          ),
          const SizedBox(
            height: 120.0,
          ),
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              filled: true,
              labelText: 'username',
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              filled: true,
              labelText: 'password',
            ),
          ),
          OverflowBar(
            alignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text("cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  _usernameController.clear();
                  _passwordController.clear();
                  Navigator.pushNamed(context, '/home');
                },
                child: const Text("enter"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
