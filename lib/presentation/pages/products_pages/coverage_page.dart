import 'package:flutter/material.dart';
import 'package:simlimites/models/sim/esim_models.dart';

class CoverageListPage extends StatefulWidget {
  CoverageListPage({Key? key, required this.coverage}) : super(key: key);

  List<Coverage> coverage;

  @override
  State<CoverageListPage> createState() => _CoverageListPageState();
}

class _CoverageListPageState extends State<CoverageListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Paises disponibles (' + widget.coverage.length.toString() + ')',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: widget.coverage.length,
          itemBuilder: (context, index) {
            final single = widget.coverage[index];
            return ListTile(
              title: Text(
                single.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          }),
    );
  }
}
