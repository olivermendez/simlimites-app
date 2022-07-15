import 'package:flutter/material.dart';

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
      backgroundColor: Colors.white,
      title: Text(
        widget.title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
      ),
      pinned: false,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          widget.backgroundImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
