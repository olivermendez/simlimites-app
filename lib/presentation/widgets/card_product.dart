import 'package:flutter/material.dart';

import '../../models/sim/esim_models.dart';

Card productSingleCardWidget(SimCountries localSim) {
  return Card(
    elevation: 0.0,
    child: ListTile(
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 18,
      ),
      leading: flagIconWidget(localSim),
      title: Text(
        localSim.productName,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text("desde US\$" + localSim.fromPrice.toString() + ".00"),
      //subtitle: Text(localSim.productType),
    ),
  );
}

ConstrainedBox flagIconWidget(SimCountries localSim) {
  return ConstrainedBox(
    constraints: const BoxConstraints(
      minWidth: 30,
      minHeight: 30,
      maxWidth: 40,
      maxHeight: 40,
    ),
    child: FadeInImage(
      placeholder: const AssetImage('assets/loading.gif'),
      image: AssetImage(localSim.flagIcon),
    ),
  );
}
