import 'package:flutter/material.dart';
import 'package:simlimites/presentation/pages/store/global_sim.dart';
import 'package:simlimites/presentation/pages/store/local_sim.dart';
import 'package:simlimites/presentation/pages/store/regional_sim.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
              labelColor: Colors.white,
              labelStyle: TextStyle(fontSize: 15),
              tabs: [
                Text("Local"),
                Text("Regional"),
                Text("Global"),
              ]),
          leading: const Icon(Icons.menu),
          title: const Text("Elija su plan"),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.search),
            ),
            Icon(Icons.more_vert),
          ],
          backgroundColor: Colors.purple,
        ),
        body: TabBarView(children: [
          const LocalSimDisplay(),
          RegionalSimDisplay(),
          GlobalSimDisplay()
        ]),
      ));
}
