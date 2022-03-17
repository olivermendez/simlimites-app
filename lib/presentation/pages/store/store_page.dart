import 'package:flutter/material.dart';
import 'package:simlimites/presentation/widgets/widgets.dart';

class StorePage extends StatefulWidget {
  StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Store'),
      body: Center(
        child: Text("Store Page"),
      ),
    );
  }
}
