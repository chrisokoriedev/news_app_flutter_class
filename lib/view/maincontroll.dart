import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter_class/view/searchpage.dart';
import 'package:news_app_flutter_class/view/setting_screen.dart';

import 'homepage.dart';

class MainConrolScreen extends StatefulWidget {
  const MainConrolScreen({Key? key}) : super(key: key);

  @override
  State<MainConrolScreen> createState() => _MainConrolScreenState();
}

class _MainConrolScreenState extends State<MainConrolScreen> {
  int _currentIndex = 0;

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const SearchPage();
      case 2:
        return const SettingPage();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(_currentIndex),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: BottomNavyBar(
          containerHeight: 60,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          selectedIndex: _currentIndex,
          onItemSelected: (index) => setState(() => _currentIndex = index),
          items: [
            BottomNavyBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
              activeColor: Colors.blue,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.search),
              title: const Text('Search'),
              activeColor: Colors.green,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.person),
              title: const Text('Profile'),
              activeColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
