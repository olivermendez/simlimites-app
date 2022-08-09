import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simlimites/infraestructure/models/package_list_model.dart';
//import 'package:simlimites/presentation/pages/products_pages/coverage_page.dart';
//import '../../../models/sim/esim_models.dart';
//import '../../widgets/widgets.dart';
//import '../../widgets/date_picker.dart';

// ignore: must_be_immutable
class ProductPage extends StatefulWidget {
  ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  DatumModel product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            //foregroundColor: Colors.black,
            stretch: true,
            pinned: true,
            floating: false,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle
              ],
              title: Text(
                widget.product.title,
                //style: const TextStyle(fontSize: 30),
              ),
              background: CachedNetworkImage(
                imageUrl: widget.product.operators.last.image.url,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            final info = widget.product.operators.last.info[index];
            return Text(
              info,
              textAlign: TextAlign.center,
            );
          }, childCount: widget.product.operators.last.info.length)),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              final opt = widget.product.operators.last.packages[index];
              return Card(
                elevation: 1,
                child: ListTile(
                  onTap: () {},
                  title: Text(opt.title),
                  trailing: Container(
                    color: const Color.fromARGB(255, 245, 245, 245),
                    child: Text(
                      'US\$ ' + opt.price.toString(),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 43, 78), fontSize: 15),
                    ),
                  ),
                ),
              );
            },
            childCount: widget.product.operators.last.packages.length,
          )),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ProductInfo extends StatefulWidget {
  ProductInfo({Key? key, required this.product}) : super(key: key);

  DatumModel product;

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.product.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Text(
            widget.product.slug,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          const Divider(
            height: 10,
          ),
          Card(
            child: ListTile(
              onTap: () {},
              focusColor: Colors.white,
              title: const Text('Paises disponibles'),
              leading: const Icon(Icons.public_outlined),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
            ),
          ),
          const Divider(
            height: 10,
          ),

          /*
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
          */
        ],
      ),
    );
  }
}

class ShowOperatorInfo extends StatefulWidget {
  final OperatorModel operatorInfo;
  ShowOperatorInfo({required this.operatorInfo, Key? key}) : super(key: key);

  @override
  State<ShowOperatorInfo> createState() => _ShowOperatorInfoState();
}

class _ShowOperatorInfoState extends State<ShowOperatorInfo> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ShowPackages extends StatefulWidget {
  final List<PackageModel> packages;
  ShowPackages({required this.packages, Key? key}) : super(key: key);

  @override
  State<ShowPackages> createState() => _ShowPackagesState();
}

class _ShowPackagesState extends State<ShowPackages> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.packages.length,
      itemBuilder: (context, index) {
        final single = widget.packages[index];
        return ListTile(
          title: Text(single.title),
        );
      },
    );
  }
}
