import 'package:delizia/core/layouts/layout_wrapper_logo.dart';
import 'package:delizia/views/home/home_page.dart';
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

  int pageSelected = 1;

  @override
  Widget build(BuildContext context) {
    final colorIcons = Theme.of(context).navigationBarTheme.indicatorColor;
    //* Pages List
    List<Widget> pages = [
      const HomePage(),
      const ProductsPage(),
      const MapPage(),
      const ProfilePage(),
    ];

    List<String> pagesNames = [
      'Inicio',
      'Mi perfil',
      'Encuentranos',
      'Nuestros productos',
    ];

    //* Menu Items List
    List<Widget> items = [
      Icon(
        Icons.home,
        color: colorIcons,
        size: 35,
      ),
      Icon(
        Icons.production_quantity_limits,
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
