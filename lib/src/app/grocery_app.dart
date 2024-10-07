import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grocery_app/src/app/app_theme.dart';
import 'package:grocery_app/src/app/route_config.dart';
import 'package:grocery_app/src/infrastructure/infrastructure.dart';

class GroceryApp extends StatefulWidget {
  const GroceryApp({super.key});

  @override
  State<GroceryApp> createState() => _GroceryAppState();
}

class _GroceryAppState extends State<GroceryApp> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(textTheme),
      scrollBehavior: const ScrollBehavior().copyWith(
        dragDevices: PointerDeviceKind.values.toSet(),
      ),
      routerConfig: AppRoute.routerConfig(UserModel.ui),
    );
  }
}
