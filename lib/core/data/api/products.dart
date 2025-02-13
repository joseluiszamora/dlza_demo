import 'dart:convert';

import 'package:delizia/core/data/models/product.dart';
import 'package:flutter/material.dart';

class Products {
  Future<List<Product>> featuredProducts(BuildContext context) async {
    List<Product> tmp = [];
    final String data = await DefaultAssetBundle.of(context)
        .loadString('assets/json/products_populares.json');
    final products = json.decode(data);

    for (var item in products) {
      Product product = Product.fromJson(item);
      tmp.add(product);
    }
    return tmp;
  }

  Future<List<Product>> drinkProducts(BuildContext context) async {
    List<Product> tmp = [];
    final String data = await DefaultAssetBundle.of(context)
        .loadString('assets/json/products_bebidas.json');
    final products = json.decode(data);

    for (var item in products) {
      Product product = Product.fromJson(item);
      tmp.add(product);
    }
    return tmp;
  }

  Future<List<Product>> milkProducts(BuildContext context) async {
    List<Product> tmp = [];
    final String data = await DefaultAssetBundle.of(context)
        .loadString('assets/json/products_lacteos.json');
    final products = json.decode(data);

    for (var item in products) {
      Product product = Product.fromJson(item);
      tmp.add(product);
    }
    return tmp;
  }

  Future<List<Product>> icecreamProducts(BuildContext context) async {
    List<Product> tmp = [];
    final String data = await DefaultAssetBundle.of(context)
        .loadString('assets/json/products_congelados.json');
    final products = json.decode(data);

    for (var item in products) {
      Product product = Product.fromJson(item);
      tmp.add(product);
    }
    return tmp;
  }
}
