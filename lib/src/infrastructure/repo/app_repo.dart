import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grocery_app/src/infrastructure/infrastructure.dart';

class GroceryShopRepository {
  GroceryShopRepository._(this.localDB);

  final IProductDatabase localDB;

  static Future<GroceryShopRepository> load(UserModel user) async {
    await Future.delayed(Duration(seconds: 1));
    final db = await ProductLocalDb.create(user);
    return GroceryShopRepository._(db);
  }
}

class ShopProvider extends InheritedWidget {
  final GroceryShopRepository repo;

  const ShopProvider({
    super.key,
    required this.repo,
    required super.child,
  });

  static GroceryShopRepository of(BuildContext context, {listen = true}) {
    if (listen) {
      return context.dependOnInheritedWidgetOfExactType<ShopProvider>()!.repo;
    } else {
      return context.getInheritedWidgetOfExactType<ShopProvider>()!.repo;
    }
  }

  @override
  bool updateShouldNotify(covariant ShopProvider oldWidget) {
    return oldWidget.repo != repo;
  }
}
