import 'package:flutter/material.dart';
import 'package:simlimites/models/sim/sim_regional_models.dart';

class RegionalSimDisplay extends StatefulWidget {
  const RegionalSimDisplay({Key? key}) : super(key: key);

  @override
  State<RegionalSimDisplay> createState() => _RegionalSimDisplayState();
}

class _RegionalSimDisplayState extends State<RegionalSimDisplay> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: SimRegionalModel.regionalList.length,
        itemBuilder: (context, index) {
          SimRegionalModel single = SimRegionalModel.regionalList[index];
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
