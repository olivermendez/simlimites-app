import 'package:flutter/material.dart';
import 'package:simlimites/infraestructure/api/get_packages_list_ds.dart';
import 'package:simlimites/navigator.utils.dart';

import '../../../infraestructure/models/package_list_model.dart';

import '../../widgets/widgets.dart';
import '../products_pages/single_product.dart';

class LocalSimDisplay extends StatefulWidget {
  const LocalSimDisplay({Key? key}) : super(key: key);

  @override
  State<LocalSimDisplay> createState() => _LocalSimDisplayState();
}

class _LocalSimDisplayState extends State<LocalSimDisplay> {
  final _ds = PackageDatasourcesApi();

  @override
  void initState() {
    super.initState();
    _ds.getOperatorsByCountry();
    //print('object');
  }

  //final List<SimCountries> data = DataServices.countriesList.toList();
  //late List<SimCountries> local;

  @override
  Widget build(BuildContext context) {
    //local = data.where((element) => element.productType == 'local').toList();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 247, 1),
      body: FutureBuilder(
        future: _ds.getOperatorsByCountry(),
        builder: (context, AsyncSnapshot<List<DatumModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData &&
              snapshot.data != null) {
            return ListOfPlans(plans: snapshot.data!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class ListOfPlans extends StatefulWidget {
  List<DatumModel> plans;
  ListOfPlans({required this.plans, Key? key}) : super(key: key);

  @override
  State<ListOfPlans> createState() => _ListOfPlansState();
}

class _ListOfPlansState extends State<ListOfPlans> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.plans.length,
      itemBuilder: (context, index) {
        final package = widget.plans[index];

        return GestureDetector(
          onTap: () {
            pushToPage(
                context,
                ProductPage(
                  product: widget.plans[index],
                ));
          },
          child: packagesCard(package),
        );
      },
    );
  }

  Padding packagesCard(DatumModel package) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, right: 3),
      child: Card(
        elevation: 0,
        child: ListTile(
          //subtitle: Text('6 plans'),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
          ),
          leading: flagIconWidget(image: package.image),
          title: Text(
            package.title,
            style: const TextStyle(
                color: Color.fromARGB(255, 0, 43, 78),
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
      ),
    );
  }
}
