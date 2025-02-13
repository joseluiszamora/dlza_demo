import 'package:delizia/core/routes/app_router.dart';
import 'package:delizia/core/themes/app_themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.defaultTheme,
      routerConfig: appRouter(),
    );
  }
}
