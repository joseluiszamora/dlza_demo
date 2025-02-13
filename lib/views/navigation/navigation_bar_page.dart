import 'package:delizia/core/layouts/layout_wrapper_logo.dart';
import 'package:delizia/views/home/home_page.dart';
import 'package:delizia/views/info/info_page.dart';
import 'package:delizia/views/map/map_page.dart';
import 'package:delizia/views/products/products_page.dart';
import 'package:delizia/views/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  int pageSelected = 2;

  @override
  Widget build(BuildContext context) {
    final colorIcons = Theme.of(context).navigationBarTheme.indicatorColor;
    //* Pages List
    List<Widget> pages = [
      const ProductsPage(),
      const InfoPage(),
      const HomePage(),
      const MapPage(),
      const ProfilePage(),
    ];

    List<String> pagesNames = [
      'Nuestros productos',
      'Información',
      'Inicio',
      'Encuentranos',
      'Mi perfil',
    ];

    //* Menu Items List
    List<Widget> items = [
      Icon(
        Icons.production_quantity_limits,
        color: colorIcons,
        size: 35,
      ),
      Icon(
        Icons.info,
        color: colorIcons,
        size: 35,
      ),
      Icon(
        Icons.home,
        color: colorIcons,
        size: 35,
      ),
      Icon(
        Icons.map,
        color: colorIcons,
        size: 35,
      ),
      Icon(
        Icons.person,
        color: colorIcons,
        size: 35,
      ),
    ];

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        child: SafeArea(
            child: LayoutWrapperLogo(
                title: pagesNames[pageSelected], child: pages[pageSelected])),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          child: CurvedNavigationBar(
            key: bottomNavigationKey,
            index: pageSelected,
            height: 60.0,
            items: items,
            color: Colors.grey,
            buttonBackgroundColor: Colors.blue,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            animationCurve: Curves.easeOutBack,
            animationDuration: const Duration(milliseconds: 1000),
            onTap: (index) {
              setState(() {
                pageSelected = index;
              });
            },
            letIndexChange: (value) => true,
          ),
        ),
      ),
    );
  }
}
