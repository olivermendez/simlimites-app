//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simlimites/infraestructure/models/package_list_model.dart';

import '../../../navigator.utils.dart';
import '../order/your_order_page.dart';

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
    bool isExtended = false;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          elevation: 0,
          onPressed: () {},
          label: AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            transitionBuilder: (Widget child, Animation<double> animation) =>
                FadeTransition(
              opacity: animation,
              child: SizeTransition(
                child: child,
                sizeFactor: animation,
                axis: Axis.horizontal,
              ),
            ),
            child: isExtended
                ? Icon(Icons.arrow_forward)
                : Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 4.0),
                        child: Icon(Icons.add),
                      ),
                      Text("Add To Order")
                    ],
                  ),
          )),
      backgroundColor: const Color.fromARGB(255, 231, 246, 255),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.network(
                  widget.product.image.url,
                  scale: 3.0,
                ),
              ),
            ],
            centerTitle: false,
            backgroundColor: const Color.fromARGB(255, 0, 57, 103),
            stretch: true,
            pinned: true,
            floating: false,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle
              ],
              title: Text(
                widget.product.title,
                style: const TextStyle(fontSize: 20),
                //style: const TextStyle(fontSize: 30),
              ),
              /*
              background: CachedNetworkImage(
                imageUrl: widget.product.operators.last.image.url,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              */
            ),
          ),
          /*
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            final info = widget.product.operators.last.info[index];
            return Text(
              info,
              textAlign: TextAlign.center,
            );
          }, childCount: widget.product.operators.last.info.length)),*/
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 20),
                  child: Text("Choose data plan"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, right: 23),
                  child: Text(
                    "USD",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              final opt = widget.product.operators.last.packages[index];
              return InkWell(
                onTap: () {
                  pushToPage(
                    context,
                    YourOrderPage(
                      selected: opt,
                      plan: widget.product,
                      flag: widget.product.image,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),

                    height: 80,
                    //color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              opt.data,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              opt.price.toString() + " USD",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(opt.day.toString() + " days"),
                            Text(opt.price.toString() + " / GB"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            childCount: widget.product.operators.last.packages.length,
          )),
          const SliverToBoxAdapter(
            child: AboutAndInstructionsWidget(),
          ),
        ],
      ),
    );
  }
}

class AboutAndInstructionsWidget extends StatelessWidget {
  const AboutAndInstructionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListTile(
            onTap: () {},
            dense: true,
            leading: const Icon(
              Icons.help,
              size: 20,
            ),
            title: const Text(
              'About eSIM',
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.help,
              size: 20,
            ),
            dense: true,
            title: const Text(
              'Instructions',
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}
