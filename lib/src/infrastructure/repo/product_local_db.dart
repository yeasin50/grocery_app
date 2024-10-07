import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/product_model.dart';
import '../models/user_model.dart';
import 'products_db_i.dart';

class ProductLocalDb implements IProductDatabase {
  ProductLocalDb._(this.user);

  final UserModel user;

  ProductState _state = ProductState(data: [], totalItem: 0);

  late StreamController<ProductState> _productController;
  Future<void> init() async {
    _productController = StreamController.broadcast(
      onListen: () {
        _productController.add(_state);
      },
    );

    _fetchP(ProductParam());
  }

  void _updateState(ProductState state) {
    _state = state;
    _productController.add(_state);
  }

  final List<ProductModel> _savedItems = [];
  List<ProductModel> get favoriteItems => _savedItems;

  final List<ProductModel> _cartItems = [];
  List<ProductModel> get cartItems => _cartItems;

  static Future<IProductDatabase> create(UserModel user) async {
    user = user;
    final repo = ProductLocalDb._(user);
    await repo.init();

    return repo;
  }

  @override
  Future<ProductModel> addToCart(ProductModel model) async {
    _cartItems.add(model);

    return model;
  }

  Future<List<ProductModel>> _fetchP(ProductParam param) async {
    final response = await rootBundle.loadString("assets/json/products.json");
    final decodedData = jsonDecode(response);
    final data = decodedData['data'] as List;
    final totalItems = decodedData['total_item'] ?? 0;
    final fetchItems = List<ProductModel>.from(data.map((e) => ProductModel.fromMap(e)));

    final ordered = fetchItems.where((e) => e.orderCounter > 0).toList();
    final saved = fetchItems.where((e) => e.isSaved).toList();

    _productController.add(ProductState(data: fetchItems, totalItem: totalItems));

    _savedItems.addAll([...saved]);
    _cartItems.addAll(ordered);
    return fetchItems;
  }

  @override
  Future<ProductModel> addOnSaved(ProductModel model) async {
    _savedItems.add(model);
    return model.copyWith(isSaved: true);
  }

  @override
  Future<ProductModel> removeFromSaved(ProductModel model) async {
    _savedItems.remove(model);
    return model.copyWith(isSaved: false);
  }

  @override
  Stream<ProductState> getProducts(ProductParam param) {
    return _productController.stream;
  }
}
