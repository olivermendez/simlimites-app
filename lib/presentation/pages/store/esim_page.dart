import 'package:flutter/material.dart';

import '../../../models/sim/data.dart';
import '../../../models/sim/esim_models.dart';

import '../../widgets/widgets.dart';
import '../products_pages/single_product.dart';

class LocalSimDisplay extends StatefulWidget {
  const LocalSimDisplay({Key? key}) : super(key: key);

  @override
  State<LocalSimDisplay> createState() => _LocalSimDisplayState();
}

class _LocalSimDisplayState extends State<LocalSimDisplay> {
  final List<SimCountries> data = DataServices.countriesList.toList();
  //late List<SimCountries> local;

  @override
  Widget build(BuildContext context) {
    //local = data.where((element) => element.productType == 'local').toList();

    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          SimCountries localSim = data[index];

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductPage(
                    product: localSim,
                  ),
                ),
              );
            },
            child: SizedBox(
              child: productSingleCardWidget(localSim),
            ),
          );
        });
  }
}
