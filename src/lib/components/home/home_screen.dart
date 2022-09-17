import 'package:flutter/material.dart';
import '../../routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      body: appScreens.elementAt(_currentIndex)['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: appScreens
              .map((item) => BottomNavigationBarItem(
                  icon: item["icon"] as Icon, label: item["title"].toString()))
              .toList(),
          onTap: _selectScreen),
    );
  }
}
