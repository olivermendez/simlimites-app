import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductSliverAppBar extends StatefulWidget {
  ProductSliverAppBar(
      {Key? key, required this.title, required this.backgroundImage})
      : super(key: key);

  String title;
  String backgroundImage;

  @override
  State<ProductSliverAppBar> createState() => _ProductSliverAppBarState();
}

class _ProductSliverAppBarState extends State<ProductSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      foregroundColor: Colors.white,
      shadowColor: Colors.red,
      backgroundColor: Colors.white,
      title: Text(
        widget.title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
      ),
      pinned: false,
      stretch: true,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        //title: Text(widget.title),
        background: Image.network(
          widget.backgroundImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
