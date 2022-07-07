import 'package:flutter/material.dart';

import '../../models/sim/sim_models.dart';

ConstrainedBox countryImageWidget(SimCountries localSim) {
  return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 30,
        minHeight: 30,
        maxWidth: 40,
        maxHeight: 40,
      ),
      child: FadeInImage(
        placeholder: const AssetImage('assets/loading.gif'),
        image: AssetImage(localSim.image),
      ));
}
