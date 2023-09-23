import 'package:conecty/utils/tab_map.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _activePageIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageDetails[_activePageIndex]['title']),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _activePageIndex = index;
          });
        },
        children: [
          pageDetails[0]['pageName'],
          pageDetails[1]['pageName'],
          pageDetails[2]['pageName'],
          pageDetails[3]['pageName'],
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: pageDetails[_activePageIndex]['bottom_color'],
        index: _activePageIndex,
        items: [
          Icon(Icons.home, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.perm_identity, size: 30),
          Icon(Icons.add, size: 30),
        ],
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(microseconds: 400), curve: Curves.ease);
        },
      ),
    );
  }
}
