import 'package:delizia/core/components/appbar/app_bar_main.dart';
import 'package:delizia/views/home/widgets/home_banner.dart';
import 'package:delizia/views/home/widgets/slider_adds.dart';
import 'package:delizia/views/products/views/row_of_products.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        AppBarMain(),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverToBoxAdapter(child: HomeBanner()),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverToBoxAdapter(
            child: RowOfProducts(
                title: "Productos Populares", category: "featured")),
        SliverToBoxAdapter(child: SizedBox(height: 10)),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(
            child: SliderAdds(),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 50)),
        // SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //     (BuildContext context, int index) {
        //       return ListTile(
        //         title: Text('Item $index'),
        //       );
        //     },
        //     childCount: 1000,
        //   ),
        // ),
      ],
    );
  }
}
