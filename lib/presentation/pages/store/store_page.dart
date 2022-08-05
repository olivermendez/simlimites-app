import 'package:flutter/material.dart';
import 'package:simlimites/presentation/pages/store/esim_page.dart';
import '../../widgets/widgets.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: storeCustomAppbar(context),
      body: const LocalSimDisplay(),

      /*

      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              HeroBanner(),
              Header("Explore Nearby"),
            ],
          )
        ],
      ),
      */
    );
  }
}

class Store2Page extends StatefulWidget {
  Store2Page({Key? key}) : super(key: key);

  @override
  State<Store2Page> createState() => _Store2PageState();
}

class _Store2PageState extends State<Store2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomScrollView(
            slivers: [
              HeroBanner(),
              Header("Explore Nearby"),
            ],
          ),
        ],
      ),
    );
  }
}

class PageViewSlider extends StatefulWidget {
  String imageUrl;
  PageViewSlider({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<PageViewSlider> createState() => _PageViewSliderState();
}

class _PageViewSliderState extends State<PageViewSlider> {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      widget.imageUrl,
      fit: BoxFit.cover,
      height: MediaQuery.of(context).size.height / 2.1,
    );
  }
}

class HeroBanner extends StatelessWidget {
  const HeroBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2.1,
        child: Stack(
          children: [
            PageView(
              children: [
                PageViewSlider(
                  imageUrl:
                      'https://images.pexels.com/photos/3935702/pexels-photo-3935702.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                ),
                PageViewSlider(
                  imageUrl:
                      'https://images.pexels.com/photos/4356144/pexels-photo-4356144.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                ),
                PageViewSlider(
                  imageUrl:
                      'https://images.pexels.com/photos/290386/pexels-photo-290386.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  newMethod(),
                  const SizedBox(
                    height: 35,
                  ),
                  const Text(
                    "Not sure where to go?\nPerfect.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton newMethod() {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(5),
        alignment: Alignment.center,
        padding: MaterialStateProperty.all(const EdgeInsets.only(
            right: 50, left: 50, top: 12.5, bottom: 12.5)),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        overlayColor: MaterialStateProperty.resolveWith(
          (states) {
            return states.contains(MaterialState.pressed)
                ? Colors.grey.shade100
                : null;
          },
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
      onPressed: () {},
      child: ShaderMask(
        shaderCallback: (bounds) =>
            const LinearGradient(colors: [Colors.purple, Colors.pink])
                .createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        ),
        child: const Text(
          "Buscar en este buscador ahora klk",
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String text;
  const Header(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 15.0),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(.9)),
        ),
      ),
    );
  }
}

class FadeAppBar extends StatelessWidget {
  final double scrollOffset;
  const FadeAppBar({Key? key, required this.scrollOffset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: Container(
          height: 100,
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 24.0,
          ),
          color: Colors.white
              .withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
          child: SafeArea(child: Container()),
        ));
  }
}
