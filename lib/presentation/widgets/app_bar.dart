import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}

class CustomAppBarStore extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const CustomAppBarStore({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: AppBar(
        bottom: TabBar(
          tabs: [
            Text(
              'Actual',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Archivado',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 5,
        title: Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
