import 'package:delizia/core/components/appbar/app_bar_main.dart';
import 'package:delizia/views/products/views/category_products.dart';
import 'package:delizia/views/products/views/row_of_products.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        AppBarMain(),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(child: CategoryProducts()),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(
            child: RowOfProducts(title: "Bebidas", category: "drinks")),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(
            child: RowOfProducts(title: "Congelados", category: "icecreams")),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(
            child: RowOfProducts(title: "Lacteos", category: "milks")),
      ],
    );
  }
}
