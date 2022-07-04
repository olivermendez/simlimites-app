import 'package:flutter/material.dart';

import '../../../models/sim/sim_global_models.dart';

class GlobalSimDisplay extends StatefulWidget {
  GlobalSimDisplay({Key? key}) : super(key: key);

  @override
  State<GlobalSimDisplay> createState() => _GlobalSimDisplayState();
}

class _GlobalSimDisplayState extends State<GlobalSimDisplay> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: SimGlobalModel.globalList.length,
        itemBuilder: (context, index) {
          SimGlobalModel single = SimGlobalModel.globalList[index];
          //SimCountries localSim = local[index];

          return GestureDetector(
            onTap: () {},
            child: Card(
              elevation: 0,
              child: ListTile(
                trailing: const Icon(Icons.arrow_forward),
                /*
                leading: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 30,
                      minHeight: 30,
                      maxWidth: 30,
                      maxHeight: 30,
                    ),
                    child: FadeInImage(
                      placeholder: const AssetImage('assets/loading.gif'),
                      image: AssetImage(single.image),
                    )),
                    */
                title: Text(single.productName),
                subtitle: Text(single.productType),
              ),
            ),
          );
        });
  }
}
