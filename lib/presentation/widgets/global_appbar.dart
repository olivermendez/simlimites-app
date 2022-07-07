import 'package:flutter/material.dart';

class HomeAppbar extends StatefulWidget {
  const HomeAppbar({Key? key}) : super(key: key);

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomeAppbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: AppBar(
        bottom: const TabBar(
            labelColor: Colors.white,
            labelStyle: TextStyle(fontSize: 15),
            tabs: [
              Text("Local"),
              Text("Regional"),
              Text("Global"),
              Text("eSIM"),
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
        //backgroundColor: Colors.blue,
      ),
    );
  }
}
