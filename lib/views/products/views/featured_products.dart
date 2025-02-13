import 'package:delizia/core/components/appbar/title_and_action_button.dart';
import 'package:delizia/core/constants/app_defaults.dart';
import 'package:delizia/core/data/api/products.dart';
import 'package:delizia/core/data/models/product.dart';
import 'package:delizia/core/routes/app_routes.dart';
import 'package:delizia/views/products/widget/bundle_tile_square.dart';
import 'package:flutter/material.dart';

class FeaturedProducts extends StatefulWidget {
  const FeaturedProducts({super.key});

  @override
  State<FeaturedProducts> createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  void _getProducts() async {
    List<Product> tmp = await Products().featuredProducts(context);

    setState(() {
      products = tmp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndActionButton(
          title: 'Productos Populares',
          onTap: () {
            // Navigator.of(context).pushNamed(AppRoutes.productDetails);
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
