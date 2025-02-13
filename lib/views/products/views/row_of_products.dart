import 'package:delizia/core/components/appbar/title_and_action_button.dart';
import 'package:delizia/core/constants/app_defaults.dart';
import 'package:delizia/core/data/api/products.dart';
import 'package:delizia/core/data/models/product.dart';
import 'package:delizia/core/routes/app_routes.dart';
import 'package:delizia/views/products/widget/bundle_tile_square.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RowOfProducts extends StatefulWidget {
  const RowOfProducts({super.key, required this.title, required this.category});
  final String title;
  final String category;

  @override
  State<RowOfProducts> createState() => _RowOfProductsState();
}

class _RowOfProductsState extends State<RowOfProducts> {
  List<Product> products = [];
  String category = "";

  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  void _getProducts() async {
    switch (widget.category) {
      case "featured":
        List<Product> tmp = await Products().featuredProducts(context);
        setState(() {
          products = tmp;
          category = "featured";
        });
        break;
      case "drinks":
        List<Product> tmp = await Products().drinkProducts(context);
        setState(() {
          products = tmp;
          category = "drinks";
        });
        break;
      case "milks":
        List<Product> tmp = await Products().milkProducts(context);
        setState(() {
          products = tmp;
          category = "milks";
        });
        break;
      case "icecreams":
        List<Product> tmp = await Products().icecreamProducts(context);
        setState(() {
          products = tmp;
          category = "icecreams";
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndActionButton(
          title: widget.title,
          isHeadline: true,
          onTap: () {
            context.go(AppRoutes.productsCategoryList, extra: category);
          },
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.only(left: AppDefaults.padding),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              products.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: AppDefaults.padding),
                child: BundleTileSquare(data: products[index]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
