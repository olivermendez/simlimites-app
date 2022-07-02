import 'package:flutter/material.dart';

class SinglePlanPage extends StatefulWidget {
  SinglePlanPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SinglePlanPage> createState() => _SinglePlanPageState();
}

class _SinglePlanPageState extends State<SinglePlanPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 224, 224, 224),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Trafico de internet"),
              Text("Duracion"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Duración"),
              Text("Duracion"),
            ],
          )
        ],
      ),
    );
  }
}
