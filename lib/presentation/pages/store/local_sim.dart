import 'package:flutter/material.dart';

import '../../../models/sim/sim_models.dart';
import '../../widgets/country_image_widget.dart';
import '../products_pages/single_product.dart';

class LocalSimDisplay extends StatefulWidget {
  const LocalSimDisplay({Key? key}) : super(key: key);

  @override
  State<LocalSimDisplay> createState() => _LocalSimDisplayState();
}

class _LocalSimDisplayState extends State<LocalSimDisplay> {
  final List<SimCountries> data = SimCountries.countriesList.toList();
  late List<SimCountries> local;

  @override
  Widget build(BuildContext context) {
    local = data.where((element) => element.productType == 'local').toList();
    int localCount = local.length;

    return ListView.builder(
        itemCount: localCount,
        itemBuilder: (context, index) {
          //SimCountries single = SimCountries.countriesList[index];
          SimCountries localSim = local[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(
                    coverage: localSim.coverage,
                    image: localSim.image,
                    titleCountry: localSim.productName,
                    datas: localSim.planes,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 0,
              child: ListTile(
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                ),
                leading: countryImageWidget(localSim),
                title: Text(localSim.productName),
                subtitle: Text(localSim.productType),
              ),
            ),
          );
        });
  }
}
