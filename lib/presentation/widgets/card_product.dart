import 'package:flutter/material.dart';

import '../../infraestructure/models/package_list_model.dart';
import '../../models/sim/esim_models.dart';

Card productSingleCardWidget(SimCountries localSim) {
  return Card(
    elevation: 0.0,
    child: ListTile(
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 18,
      ),
      //leading: flagIconWidget(localSim),
      title: Text(
        localSim.productName,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        "desde: \$" + localSim.fromPrice.toString() + ".00",
        style: const TextStyle(
          color: Color.fromARGB(255, 0, 121, 219),
          fontWeight: FontWeight.bold,
        ),
      ),
      //subtitle: Text(localSim.productType),
    ),
  );
}

ConstrainedBox flagIconWidget({required ImageModel image}) {
  return ConstrainedBox(
    constraints: const BoxConstraints(
      minWidth: 30,
      minHeight: 30,
      maxWidth: 40,
      maxHeight: 40,
    ),
    child: FadeInImage(
      placeholder: const AssetImage('assets/loading.gif'),
      image: NetworkImage(image.url),
    ),
  );
}
