import 'package:flutter/material.dart';

import '../widgets.dart';

PreferredSize storeCustomAppbar(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(55),
    child: AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(),
      ),
      backgroundColor: const Color.fromARGB(255, 4, 45, 90),
      foregroundColor: Colors.black,
      elevation: 3.0,
      leading: Padding(
        child: Image.asset('assets/imagotipo.png'),
        padding: const EdgeInsets.only(left: 15),
      ),
      title: const Text(
        'Elige tú plan eSIM',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: CountrySearchDelegate(),
            );
          },
          icon: const Icon(Icons.search, color: Colors.white),
        ),
      ],
    ),
  );
}
