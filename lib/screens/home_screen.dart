import 'package:flutter/material.dart';
import 'package:tiktok_clone/screens/coming_soon.dart';
import 'package:tiktok_clone/screens/tiktok_screen/tik_tok_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIdx = 0;

  static List<Widget> pages = [
    const TikTokScreen(),
    const ComingSoon(),
    const ComingSoon(),
    const ComingSoon(),
    const ComingSoon(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx) {
          setState(() {
            pageIdx = idx;
          });
        },
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: pageIdx,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.find_replace, size: 30),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity_outlined, size: 30),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark, size: 30),
            label: 'BookMarks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined, size: 30),
            label: 'Profile',
          ),
        ],
      ),
      body: pages[pageIdx],
    );
  }
}
