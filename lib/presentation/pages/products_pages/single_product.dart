import 'package:flutter/material.dart';
import '../../../models/sim/sim_models.dart';

class ProductPage extends StatefulWidget {
  ProductPage({
    Key? key,
    required this.image,
    required this.datas,
    required this.titleCountry,
    required this.coverage,
  }) : super(key: key);

  final List<PlanData> datas;
  final String titleCountry;
  final String image;
  List<Coverage> coverage;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(widget.titleCountry),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.favorite),
          ),
        ],
        //backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            height: 370,
            width: MediaQuery.of(context).size.width,
            child: Image.network(widget.image),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.datas.length,
              itemBuilder: ((context, index) {
                final single = widget.datas[index];
                return GestureDetector(
                  onTap: () {
                    customModalBottomSheet(context, single);
                  },
                  child: Card(
                    elevation: 0,
                    child: ListTile(
                      title: Text(
                        single.gbCount,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(single.days + " días"),
                      trailing: Text(
                        single.price.toString() +
                            " " +
                            single.currentyType.toString(),
                      ),
                    ),
                  ),
                );
              }),
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
                widget.titleCountry,
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
                label: Text("Comprar plan para USD${single.price}.00"),
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
