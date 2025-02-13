import 'package:delizia/core/routes/app_routes.dart';
import 'package:delizia/views/products/views/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Nuestros Productos',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 120,
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              CategoryTile(
                icon: const FaIcon(
                  FontAwesomeIcons.bottleWater,
                  color: Colors.green,
                  size: 40,
                ),
                label: 'Bebidas',
                // backgroundColor: AppColors.primary,
                onTap: () {
                  context.go(AppRoutes.productsCategoryList, extra: "drinks");
                },
              ),
              CategoryTile(
                icon: const FaIcon(
                  FontAwesomeIcons.iceCream,
                  color: Colors.red,
                  size: 40,
                ),
                label: 'Congelados',
                onTap: () {
                  context.go(AppRoutes.productsCategoryList,
                      extra: "icecreams");
                },
              ),
              CategoryTile(
                icon: const FaIcon(
                  FontAwesomeIcons.cow,
                  color: Colors.blue,
                  size: 40,
                ),
                label: 'Lacteos',
                onTap: () {
                  context.go(AppRoutes.productsCategoryList, extra: "milks");
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
