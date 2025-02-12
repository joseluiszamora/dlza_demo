import 'package:delizia/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarMain extends StatelessWidget {
  const AppBarMain({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Center(
        child: SizedBox(
          height: 45,
          child: Image(
            image: AssetImage("assets/img/delizia_logo.png"),
            fit: BoxFit.contain,
          ),
        ),
      ),
      floating: true,
      pinned: true,
      snap: true,
      // expandedHeight: 200,
      // flexibleSpace: FlexibleSpaceBar(
      //   background: Image.asset(
      //     'assets/img/delizia_banner.png',
      //     fit: BoxFit.cover,
      //   ),
      // ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: ElevatedButton(
          onPressed: () {
            // Navigator.pushNamed(context, AppRoutes.drawerPage);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFF2F6F3),
            shape: const CircleBorder(),
          ),
          child: SvgPicture.asset(AppIcons.sidebarIcon),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8, top: 4, bottom: 4),
          child: ElevatedButton(
            onPressed: () {
              // Navigator.pushNamed(context, AppRoutes.search);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF2F6F3),
              shape: const CircleBorder(),
            ),
            child: SvgPicture.asset(AppIcons.search),
          ),
        ),
      ],
    );
  }
}
