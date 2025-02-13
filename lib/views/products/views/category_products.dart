import 'package:delizia/core/constants/app_colors.dart';
import 'package:delizia/views/products/views/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Categorias de Productos',
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
                  // Navigator.pushNamed(context, AppRoutes.categoryDetails);
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
                  // Navigator.pushNamed(context, AppRoutes.categoryDetails);
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
                  // Navigator.pushNamed(context, AppRoutes.categoryDetails);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
