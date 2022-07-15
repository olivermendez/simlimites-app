import 'package:flutter/material.dart';
import 'package:simlimites/presentation/pages/store/esim_page.dart';
import '../../widgets/widgets.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: storeCustomAppbar(context),
      body: const LocalSimDisplay(),
    );
  }
}
