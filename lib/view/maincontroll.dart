import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
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
        return HomePage();
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
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: [
          FlashyTabBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.search),
            title: const Text('Search'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Account'),
          ),
        ],
      ),
    );
  }
}
