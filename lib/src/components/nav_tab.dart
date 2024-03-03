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
        color: const Color.fromRGBO(51, 59, 71, 1),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Divider(
            height: 1,
            thickness: 1,
            color:
            //  Color(0xFFE30613),
                // Colors.grey
                Color.fromRGBO(136, 4, 12, 1),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 8, bottom: 20, left: 10, right: 10),
            child: GNav(
              onTabChange: _navigationBar,
              backgroundColor: const Color.fromRGBO(51, 59, 71, 1),
              color: Colors.white,
              activeColor: const Color.fromRGBO(136, 4, 12, 1),
              tabBackgroundColor: const Color.fromRGBO(33, 38, 46, 1),
              gap: 8,
              padding: const EdgeInsets.only(
                  top: 8, bottom: 8, left: 10, right: 10),
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
        ]),
      ),
    );
  }
}
