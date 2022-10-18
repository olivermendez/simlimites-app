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
      backgroundColor: const Color.fromARGB(255, 229, 244, 255),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Payment"),
      ),
      body: Column(
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20, right: 20),
                child: Text("Choose data plan"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, right: 20),
            child: Container(
              //margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(20.0),
              //height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.plan.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            const Text(
                              "country",
                              style: TextStyle(
                                color: Color.fromARGB(255, 34, 34, 34),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const Divider(),
                  Text(
                    widget.selected.data,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Valid for " + widget.selected.day.toString() + " days",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 34, 34, 34),
                    ),
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
