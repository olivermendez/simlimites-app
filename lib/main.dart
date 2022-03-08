import 'package:flutter/material.dart';
import 'package:simlimites/src/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _dataService = DataServices();
  String? _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Simlimites'),
        ),
        body: Center(child: Builder(
          builder: (_) {
            if (_response != null) {
              return Text(_response!);
            } else {
              return ElevatedButton(
                  onPressed: _makeRequest, child: const Text('Make request'));
            }
          },
        )),
      ),
    );
  }

  void _makeRequest() async {
    final response = await _dataService.placeOrderATT();
    setState(() => _response = response);
  }
}
