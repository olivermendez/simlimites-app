import 'package:flutter/material.dart';
import 'package:simlimites/infraestructure/models/package_list_model.dart';
import 'package:simlimites/presentation/pages/screens.dart';

class YourOrderPage extends StatefulWidget {
  PackageModel selected;
  ImageModel flag;
  DatumModel plan;
  YourOrderPage({
    Key? key,
    required this.selected,
    required this.flag,
    required this.plan,
  }) : super(key: key);

  @override
  State<YourOrderPage> createState() => _YourOrderPageState();
}

class _YourOrderPageState extends State<YourOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Payment"),
      ),
      body: Column(
        children: [
          const Text("Data Plan chosed"),
          Card(
            elevation: 5,
            child: Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              //height: 120,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
                //color: Color.fromARGB(255, 217, 217, 217),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      flagIconWidget(image: widget.flag),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(widget.plan.title),
                      )
                    ],
                  ),
                  const Divider(),
                  Text(
                    widget.selected.data,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Valid for " + widget.selected.day.toString() + " days",
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total Cost"),
                Text(
                  widget.selected.price.toString() + " USD",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
