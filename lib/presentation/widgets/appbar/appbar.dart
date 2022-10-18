import 'package:flutter/material.dart';

AppBar normalAppBar(String name) {
  return AppBar(
    title: Text(
      name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    elevation: 1,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,

/*
    leading: Padding(
      child: Image.asset(
        'assets/imagotipo.png',
        scale: 1.0,
      ),
      padding: const EdgeInsets.only(left: 15),
    ),
    */
  );
}
