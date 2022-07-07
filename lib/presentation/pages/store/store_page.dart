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
          //leading: const Icon(Icons.menu),
          title: const Text("Elija su plan"),
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
            const Icon(Icons.more_vert),
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
