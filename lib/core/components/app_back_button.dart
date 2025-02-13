import 'package:delizia/core/constants/app_icons.dart';
import 'package:delizia/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AppBackButton extends StatelessWidget {
  /// Custom Back labelLarge with a custom ICON for this app
  const AppBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(AppIcons.arrowBackward),
      onPressed: () => context.go(AppRoutes.navigation),
    );
  }
}
