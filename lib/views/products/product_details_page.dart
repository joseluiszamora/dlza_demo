import 'package:delizia/core/components/app_back_button.dart';
import 'package:delizia/core/components/buy_now_row_button.dart';
import 'package:delizia/core/components/price_and_quantity.dart';
import 'package:delizia/core/components/product_images_slider.dart';
import 'package:delizia/core/constants/app_defaults.dart';
import 'package:delizia/core/data/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(product.category),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
          child: BuyNowRow(
            onBuyButtonTap: () {},
            onCartButtonTap: () {},
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppDefaults.padding),
          child: Column(
            children: [
              //* Images Gallery
              ProductImagesSlider(images: product.images),

              //* Product name
              Text(
                product.name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),

              //* Flavors list
              product.flavors.isNotEmpty
                  ? Column(
                      children: [
                        const SizedBox(height: 8),
                        Text(product.flavors.toString()),
                      ],
                    )
                  : const SizedBox.shrink(),

              //* Price and Quantity
              const SizedBox(height: AppDefaults.padding * 2),
              PriceAndQuantityRow(
                currentPrice: product.priceOffer,
                orginalPrice: product.price,
                quantity: 1,
              ),
              const SizedBox(height: AppDefaults.padding),

              //* Product Description
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Detalles del producto',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                const SizedBox(height: AppDefaults.padding),
                Text(product.desc),
              ]),

              const SizedBox(height: AppDefaults.padding),

              //* Product Info
              product.info != ""
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Text('Información del producto',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                          const SizedBox(height: AppDefaults.padding),
                          Text(product.info),
                        ])
                  : const SizedBox.shrink(),

              /// Review Row
              // const Padding(
              //   padding: EdgeInsets.symmetric(
              //     horizontal: AppDefaults.padding,
              //     // vertical: AppDefaults.padding,
              //   ),
              //   child: Column(
              //     children: [
              //       Divider(thickness: 0.1),
              //       ReviewRowButton(totalStars: 5),
              //       Divider(thickness: 0.1),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
