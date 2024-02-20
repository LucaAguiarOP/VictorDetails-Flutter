import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

import 'package:victordetailsflutter/src/car_page.dart';
import 'package:victordetailsflutter/src/diary_page.dart';
import 'package:victordetailsflutter/src/profile_page.dart';
import 'package:victordetailsflutter/src/shop_page.dart';

class NavTab extends StatefulWidget {
  const NavTab({super.key});

  @override
  State<NavTab> createState() => _NavTabState();
}

class _NavTabState extends State<NavTab> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const CarPage(),
    const DiaryPage(),
    const ShopPage(),
    ProfilePage(),
  ];

  void _navigationBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.only(top:8, bottom:25, left: 10, right: 10 ),
            child: GNav(
              onTabChange: _navigationBar,
              backgroundColor: Colors.transparent,
              color: Colors.white,
              activeColor: const Color(0xFFE30613),
              tabBackgroundColor: Colors.grey.shade900,
              gap: 8,
              padding:  const EdgeInsets.only(top:8, bottom:10, left: 10, right: 10 ),
              tabs: const [
                GButton(
                  icon: (Iconsax.car),
                  text: 'Garagem',
                ),
                GButton(
                  icon: (Iconsax.task_square),
                  text: 'Agenda',
                ),
                GButton(
                  icon: (Iconsax.shop),
                  text: 'Serviços',
                ),
                GButton(
                  icon: (Iconsax.profile_circle),
                  text: 'Perfil',
                ),
              ],
            ),
          ),
        ),
      );
  }
}
