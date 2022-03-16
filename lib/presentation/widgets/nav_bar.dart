import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.white,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                icon: Icon(Icons.store),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/mysim');
                },
                icon: Icon(Icons.sim_card),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/account');
                },
                icon: Icon(Icons.account_circle),
              )
            ],
          ),
        ));
  }
}
