import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyre_test/constants/icons.dart';
import 'package:qyre_test/presentation/pages/main_page.dart';
import 'package:qyre_test/presentation/pages/modification_page.dart';
import 'package:qyre_test/presentation/pages/notifications_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> screens = const [
    MainPage(),
    ModificationPage(),
    NotificatinPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        iconSize: 24,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppIcons.menu),
            label: 'menu',
          ),
          BottomNavigationBarItem(icon: SvgPicture.asset(AppIcons.notification), label: 'notification'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
