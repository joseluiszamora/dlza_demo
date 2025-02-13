import 'package:delizia/core/constants/app_colors.dart';
import 'package:delizia/core/constants/app_defaults.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/components/network_image.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.icon,
    required this.label,
    this.backgroundColor,
    required this.onTap,
  });

  final FaIcon icon;
  final String label;
  final Color? backgroundColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.scaffoldBackground,
      child: InkWell(
        borderRadius: AppDefaults.borderRadius,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(AppDefaults.padding * 1),
              decoration: BoxDecoration(
                color: backgroundColor ?? AppColors.textInputBackground,
                shape: BoxShape.circle,
              ),
              child: SizedBox(
                width: 50,
                child: Center(child: icon),
                // child: AspectRatio(
                //   aspectRatio: 1 / 1,
                //   child: NetworkImageWithLoader(
                //     imageLink,
                //     fit: BoxFit.contain,
                //   ),
                // ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
