import 'package:flutter/material.dart';

import '../pages/screens.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      HomePage(),
      MySimPage(),
      AccountPage(),

      //MyAccountPage(token: token)
    ];

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            // ignore: deprecated_member_use
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            // ignore: deprecated_member_use
            label: 'My Ship',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            // ignore: deprecated_member_use
            label: 'My Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
