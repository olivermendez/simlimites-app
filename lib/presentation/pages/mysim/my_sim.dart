import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
//import 'package:simlimites/domain/entities/package_lists.dart';

import '../../../infraestructure/api/get_packages_list_ds.dart';
import '../../../infraestructure/models/package_list_model.dart';
import '../../widgets/widgets.dart';

class MySimPage extends StatefulWidget {
  const MySimPage({Key? key}) : super(key: key);

  static const String routeName = '/mysim';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const MySimPage(),
    );
  }

  @override
  State<MySimPage> createState() => _MySimPageState();
}

class _MySimPageState extends State<MySimPage> {
  final _ds = PackageDatasourcesApi();

  @override
  void initState() {
    super.initState();
    _ds.getOperatorsByCountry();
  }

  @override
  Widget build(BuildContext context) {
    return scaffolding();
  }

  Scaffold scaffolding() {
    return Scaffold(
      appBar: normalAppBar('My Sim'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 140,
              width: 140,
              child: Lottie.network(
                'https://assets4.lottiefiles.com/packages/lf20_2gfeptkg.json',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
                child: Text(
              "No tienes ningun servicio contratado",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            )),
          ),
        ],

        //bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }
}

// ignore: must_be_immutable
class OperatorsCards extends StatefulWidget {
  List<DatumModel> plans;
  OperatorsCards({required this.plans, Key? key}) : super(key: key);

  @override
  State<OperatorsCards> createState() => _OperatorsCardsState();
}

class _OperatorsCardsState extends State<OperatorsCards> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.plans.length,
      itemBuilder: (context, index) {
        final package = widget.plans[index];

        return Card(
          elevation: 0.0,
          child: ListTile(
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
            ),
            leading: flagIconWidget(image: package.image),
            title: Text(
              package.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            /*
            subtitle: Text(
              opt.countryCode.toString(),
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 121, 219),
                fontWeight: FontWeight.bold,
              ),
            
            ),
            */
            //subtitle: Text(localSim.productType),
          ),
        );
      },
    );
  }
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
