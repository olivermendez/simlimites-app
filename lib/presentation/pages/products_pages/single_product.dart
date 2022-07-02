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
  List<String> coverage;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(widget.titleCountry),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.favorite),
          ),
        ],
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Selecciona el plan de data",
            textAlign: TextAlign.end,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.datas.length,
              itemBuilder: ((context, index) {
                final single = widget.datas[index];
                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isDismissible: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                      context: context,
                      builder: (context) {
                        return Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.wifi),
                              title: const Text(
                                'Trafico de internet',
                              ),
                              trailing: Text(
                                single.gbCount,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.calendar_month),
                              title: const Text(
                                'Duración',
                              ),
                              trailing: Text(
                                single.days + " días",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Divider(),
                            ListTile(
                              leading: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    minWidth: 40,
                                    minHeight: 40,
                                    maxWidth: 40,
                                    maxHeight: 40,
                                  ),
                                  child: FadeInImage(
                                    placeholder:
                                        const AssetImage('assets/loading.gif'),
                                    image: AssetImage(widget.image),
                                  )),
                              title: const Text(
                                'Zonas con covertura',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(widget.coverage.toString()),
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 120,
                            ),
                            FloatingActionButton.extended(
                              icon: const Icon(Icons.shopping_bag_outlined),
                              elevation: 1,
                              onPressed: () {},
                              label: Text(
                                  "Comprar plan para USD${single.price}.00"),
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Card(
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
}
