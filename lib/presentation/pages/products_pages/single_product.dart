import 'package:flutter/material.dart';
import 'package:simlimites/presentation/pages/products_pages/coverage_page.dart';
import '../../../models/sim/esim_models.dart';
import '../../widgets/widgets.dart';
import '../../widgets/date_picker.dart';

class ProductPage extends StatefulWidget {
  ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  SimCountries product;

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
            title: widget.product.productName,
            backgroundImage: widget.product.cardImage.toString(),
          ),
          SliverToBoxAdapter(
            child: ProductInfo(
              product: widget.product,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductInfo extends StatefulWidget {
  ProductInfo({Key? key, required this.product}) : super(key: key);

  SimCountries product;

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
            Text(
              widget.product.productName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Text(
              widget.product.shortDescription,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
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
                        coverage: widget.product.coverage,
                      ),
                    ),
                  );
                },
                focusColor: Colors.white,
                title: const Text('Paises disponibles'),
                leading: const Icon(Icons.public_outlined),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
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
