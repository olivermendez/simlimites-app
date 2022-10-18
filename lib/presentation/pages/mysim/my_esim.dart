import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../infraestructure/api/get_packages_list_ds.dart';
import '../../../infraestructure/models/package_list_model.dart';

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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: const Text("My eSIM"),
            bottom: const TabBar(
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    text: "Valid",
                  ),
                  Tab(
                    text: "Expired",
                  ),
                ]),
          ),
          //appBar: normalAppBar('My Sim'),
          body: TabBarView(children: [
            ValidPageMyeSIM(),
            ExpiredPageMyeSIM(),
          ])),
    );
  }
}

class ValidPageMyeSIM extends StatelessWidget {
  const ValidPageMyeSIM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey[200],
            ),
            height: 160,
            child: Column(
              children: [
                // Country information
                Expanded(
                    child: ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.wordpress),
                  title: const Text("United State"),
                  subtitle: const Text("country"),
                  trailing: const Icon(Icons.arrow_forward),
                )),

                //Data remaining
                LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 50,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2000,
                  percent: 0.5,
                  center: const Text(
                    "60.0%",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  //linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: const Color.fromARGB(255, 0, 110, 158),
                ),

                //valid dates
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("used: 3 of 5 GB"),
                      Text("valid until: 12 june 2021"),
                    ],
                  ),
                )),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ExpiredPageMyeSIM extends StatelessWidget {
  //const ValidPageMyeSIM({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("expired esim"));
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
