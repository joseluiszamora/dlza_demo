import 'package:delizia/core/data/models/product.dart';
import 'package:delizia/core/routes/app_routes.dart';
import 'package:delizia/views/navigation/navigation_bar_page.dart';
import 'package:delizia/views/products/product_details_page.dart';
import 'package:go_router/go_router.dart';

GoRouter appRouter() => GoRouter(
      initialLocation: AppRoutes.navigation,
      routes: publicRoutes(),
    );

List<RouteBase> publicRoutes() => [
      GoRoute(
          path: AppRoutes.navigation,
          builder: (context, state) => const NavigationBarPage()),
      GoRoute(
          path: AppRoutes.productDetails,
          builder: (context, state) {
            final product = state.extra as Product;
            return ProductDetailsPage(product: product);
          }),
    ];
