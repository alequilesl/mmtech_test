import 'package:flutter/material.dart';
import 'package:mmtech_test/views/home/pages/chess/page_chess.dart';
import 'package:mmtech_test/views/home/pages/disney/page_disney.dart';

import 'pages/home/page_home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int selectedTab= 0;
  final _pageViewController = PageController();

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors= Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Hero(tag: 'mmtech',
      child: Text('MMTECH', style: TextStyle(color: colors.primary),),)),
      body: PageView(
        controller: _pageViewController,
        onPageChanged: (index) {
          setState(() {
            selectedTab = index;
          });
        },
        children: const [
          PageHome(),
          PageDisney(),
          PageChess()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedTab,
          onTap: (index){
            _pageViewController.animateToPage(index, duration: const Duration(milliseconds: 200), curve: Curves.bounceOut);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.picture_in_picture_alt_outlined),
              activeIcon: Icon(Icons.picture_in_picture_alt),
              label: 'Disney'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.query_stats_outlined),
              activeIcon: Icon(Icons.query_stats),
              label: 'Chess Players'
            ),
          ]
      ),
    );
  }
}
