import 'package:delizia/core/constants/app_defaults.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const AspectRatio(
          aspectRatio: 16 / 9,
          child: Image(
            image: AssetImage("assets/img/delizia_banner.png"),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
