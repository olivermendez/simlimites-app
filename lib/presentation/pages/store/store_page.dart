import 'package:flutter/material.dart';

import 'package:simlimites/presentation/pages/store/esim_page.dart';

import '../home/country_search.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(),
          ),
          backgroundColor: Colors.white,
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
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CountrySearchDelegate(),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
      ),
      body: const LocalSimDisplay(),
    );
  }
}

Widget searchBarWidget(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Container(
          color: const Color.fromARGB(255, 4, 45, 90),

          height: 37,
          //margin: const EdgeInsets.only(left: 15),
          child: Material(
            //color: const Color.fromARGB(255, 4, 45, 90),
            borderRadius: BorderRadius.circular(7),
            elevation: 1,
            child: TextFormField(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: CountrySearchDelegate(),
                );
              },
              decoration: const InputDecoration(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 4, 45, 90),
                  contentPadding: EdgeInsets.only(top: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                  hintText: 'Buscar en Simlimites',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  )),
            ),
          ),
        ),
      ),
    ],
  );
}
