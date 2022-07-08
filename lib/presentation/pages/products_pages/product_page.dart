import 'package:flutter/material.dart';

import '../../../models/sim/sim_models.dart';
import 'date_picker.dart';

class ProductsPages extends StatefulWidget {
  ProductsPages(
      {required this.countryName,
      required this.cardImage,
      required this.datas,
      required this.coverage,
      Key? key})
      : super(key: key);

  String cardImage;
  String countryName;
  final List<PlanData> datas;

  List<Coverage> coverage;

  @override
  State<ProductsPages> createState() => _ProductsPagesState();
}

class _ProductsPagesState extends State<ProductsPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.countryName),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 370,
              child: Image.network(
                widget.cardImage,
                //height: 00,
              ),
            ),
          ),
          const Divider(),
          DateRangeWidget(),
          const Divider(),
          GridView.builder(
            shrinkWrap: true,
            itemCount: widget.datas.length,
            itemBuilder: ((context, index) {
              final single = widget.datas[index];
              return InkWell(
                onTap: () {
                  customModalBottomSheet(context, single);
                },
                child: Card(
                  color: const Color.fromARGB(255, 239, 239, 239),
                  elevation: 1,
                  child: ListTile(
                    title: Text(
                      single.days + " días ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 170, 255)),
                    ),
                    subtitle: Text("\$" + single.price.toString() + " USD",
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black)),
                  ),
                ),
              );
            }),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 180,
              childAspectRatio: 3 / 2,
              mainAxisExtent: 90,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> customModalBottomSheet(
    BuildContext context,
    PlanData single,
  ) {
    return showModalBottomSheet(
      //isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          child: Column(
            children: [
              informationWidget(
                'Cobertura',
                widget.countryName,
                Icons.public,
              ),
              informationWidget(
                'Datos',
                single.gbCount,
                Icons.wifi,
              ),
              informationWidget(
                'Duración',
                single.days + " días",
                Icons.calendar_month,
              ),
              const Divider(),
              const ListTile(
                title: Text(
                  'Zonas con covertura',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: _converturaWidget(widget.coverage),
              ),
              FloatingActionButton.extended(
                icon: const Icon(Icons.shopping_bag_outlined),
                elevation: 1,
                onPressed: () {},
                label: const Text("Continue"),
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }

  ListTile informationWidget(
    String concept,
    String result,
    IconData icon,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        concept,
      ),
      trailing: Text(
        result,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _converturaWidget(List<Coverage> country) {
    return Container(
      child: ListView.builder(
        itemCount: country.length,
        itemBuilder: (context, index) {
          return Text("    " + country[index].name);
        },
      ),
    );
  }
}
