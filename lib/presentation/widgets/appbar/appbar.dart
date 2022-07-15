import 'package:flutter/material.dart';

AppBar normalAppBar(String name) {
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
