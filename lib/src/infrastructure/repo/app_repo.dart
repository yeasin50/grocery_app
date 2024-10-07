import 'dart:async';

import 'package:flutter/material.dart';
import '../infrastructure.dart';

class GroceryShopRepository {
  GroceryShopRepository._(this.localDB);

  final IProductDatabase localDB;

  late StreamController<ProductState> _productController;

  Stream<ProductState> get stream => _productController.stream;

  ProductState _state = ProductState.none;
  ProductState get state => _state;

  static Future<GroceryShopRepository> create(UserModel user) async {
    await Future.delayed(const Duration(seconds: 1));
    final db = await ProductLocalDb.create(user);

    final repo = GroceryShopRepository._(db);

    await repo.init();
    return repo;
  }

  Future<void> init() async {
    _productController = StreamController.broadcast(
      onListen: () => _updateState(_state),
    );
  }

  void _updateState(ProductState state) {
    _state = state;
    _productController.add(_state);
  }

  Future<void> fetchItem(ProductParam param) async {
    final result = await localDB.getProducts(param);

    _updateState(
      state.copyWith(
        data: [..._state.data, ...result.data],
        filterData: [..._state.filterData, ...result.filterData],
        totalItem: result.totalItem,
      ),
    );
  }

  void productByType(ProductType type) {
    final filterItems = _state.data.where((e) => e.type == type).toList();
    print("filtered items ${filterItems.length}");
    _updateState(_state.copyWith(filterData: filterItems));
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
