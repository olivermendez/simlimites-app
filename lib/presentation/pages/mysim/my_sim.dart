import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

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
    return Scaffold(
      appBar: normalAppBar('My Sim'),
      body: FutureBuilder(
        future: _ds.getOperatorsByCountry(),
        builder: (context, AsyncSnapshot<List<DatumModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData &&
              snapshot.data != null) {
            return Center(
              child: Text(snapshot.data![0].slug),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
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
