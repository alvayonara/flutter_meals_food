import 'package:flutter/material.dart';

import 'breakfast_screen.dart';
import 'desert_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _indexSelected = 0;
  final _widgetOptions = [
    Breakfast(),
    Desert(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals Food'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_indexSelected),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            title: Text('Breakfast'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            title: Text('Desert'),
          )
        ],
        currentIndex: _indexSelected,
        fixedColor: Colors.cyan,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _indexSelected = index;
    });
  }
}
