import 'package:flutter/material.dart';
import 'package:simlimites/presentation/pages/store/global_sim.dart';
import 'package:simlimites/presentation/pages/store/local_sim.dart';
import 'package:simlimites/presentation/pages/store/regional_sim.dart';

import '../home/country_search.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          //foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 4, 45, 90),
          elevation: 0,
          automaticallyImplyLeading: false,
          bottom: const TabBar(
              labelColor: Colors.white,
              labelStyle: TextStyle(fontSize: 15),
              tabs: [
                Text("Local"),
                Text("Regional"),
                Text("Global"),
                Text("eSIM"),
              ]),
          leading: Padding(
            child: Image.asset('assets/imagotipo.png'),
            padding: const EdgeInsets.only(left: 15),
          ),
          title: const Text(
            "Elija su plan",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CountrySearchDelegate(),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ),
            //const Icon(Icons.more_vert),
          ],
          //backgroundColor: Colors.blue,
        ),
        body: TabBarView(children: [
          const LocalSimDisplay(),
          const RegionalSimDisplay(),
          GlobalSimDisplay(),
          Container(),
        ]),
      ),
    );
  }
}
