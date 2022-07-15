import 'package:flutter/material.dart';
import 'package:simlimites/presentation/pages/products_pages/coverage_page.dart';
import '../../../models/sim/esim_models.dart';
import '../../widgets/widgets.dart';
import '../../widgets/date_picker.dart';

class ProductPage extends StatefulWidget {
  ProductPage({
    Key? key,
    required this.datas,
    required this.cardImage,
    required this.countryName,
    required this.coverage,
  }) : super(key: key);

  String cardImage;
  String countryName;
  final List<PlanData> datas;

  List<Coverage> coverage;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProductSliverAppBar(
            title: widget.countryName,
            backgroundImage: widget.cardImage,
          ),
          SliverToBoxAdapter(
            child: ProductInfo(
              coverage: widget.coverage,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductInfo extends StatefulWidget {
  ProductInfo({Key? key, required this.coverage}) : super(key: key);

  List<Coverage> coverage;

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Estados Unidos",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const Text(
              "product description",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            ),
            const Divider(
              height: 20,
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CoverageListPage(
                                coverage: widget.coverage,
                              )));
                },
                focusColor: Colors.white,
                title: Text('Paises disponibles'),
                leading: Icon(Icons.public_outlined),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
            const Divider(
              height: 20,
            ),
            const Text(
              "fecha de activacion",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            DateRangeWidget(),
            const Divider(
              height: 10,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
