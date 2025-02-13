import 'package:delizia/core/components/app_back_button.dart';
import 'package:delizia/core/constants/app_defaults.dart';
import 'package:delizia/core/data/api/products.dart';
import 'package:delizia/core/data/models/product.dart';
import 'package:delizia/views/products/widget/product_tile_square.dart';
import 'package:flutter/material.dart';

class ProductsCategoryList extends StatefulWidget {
  const ProductsCategoryList({super.key, required this.category});
  final String category;

  @override
  State<ProductsCategoryList> createState() => _ProductsCategoryListState();
}

class _ProductsCategoryListState extends State<ProductsCategoryList> {
  List<Product> products = [];
  String title = "";

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
          title = "Productos Populares";
        });
        break;
      case "drinks":
        List<Product> tmp = await Products().drinkProducts(context);
        setState(() {
          products = tmp;
          title = "Bebidas";
        });
        break;
      case "milks":
        List<Product> tmp = await Products().milkProducts(context);
        setState(() {
          products = tmp;
          title = "Lacteos";
        });
        break;
      case "icecreams":
        List<Product> tmp = await Products().icecreamProducts(context);
        setState(() {
          products = tmp;
          title = "Congelados";
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
        leading: const AppBackButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
          child: GridView.builder(
            padding: const EdgeInsets.only(top: AppDefaults.padding),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 0.64,
              mainAxisSpacing: 16,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductTileSquare(
                data: products[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
