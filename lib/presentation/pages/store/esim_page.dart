import 'package:flutter/material.dart';
import 'package:simlimites/presentation/pages/products_pages/product_page.dart';

import '../../../models/sim/data.dart';
import '../../../models/sim/esim_models.dart';
import '../../widgets/flag_icon.dart';
import '../products_pages/single_product.dart';

class LocalSimDisplay extends StatefulWidget {
  const LocalSimDisplay({Key? key}) : super(key: key);

  @override
  State<LocalSimDisplay> createState() => _LocalSimDisplayState();
}

class _LocalSimDisplayState extends State<LocalSimDisplay> {
  final List<SimCountries> data = DataServices.countriesList.toList();
  late List<SimCountries> local;

  @override
  Widget build(BuildContext context) {
    local = data.where((element) => element.productType == 'local').toList();

    return ListView.builder(
        //gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        //  maxCrossAxisExtent: 400,
        //  childAspectRatio: 3 / 1,
        //  crossAxisSpacing: 20,
        //  mainAxisSpacing: 2,
        //),
        itemCount: local.length,
        itemBuilder: (context, index) {
          SimCountries localSim = local[index];

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductPage(
                    cardImage: localSim.cardImage.toString(),
                    countryName: localSim.productName,
                    datas: localSim.planes,
                    coverage: localSim.coverage,
                  ),
                ),
              );
            },
            child: SizedBox(
              child: Card(
                elevation: 0.0,
                child: ListTile(
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                  ),
                  leading: countryImageWidget(localSim),
                  title: Text(
                    localSim.productName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                      "desde US\$" + localSim.fromPrice.toString() + ".00"),
                  //subtitle: Text(localSim.productType),
                ),
              ),
            ),
          );
        });
  }
}
