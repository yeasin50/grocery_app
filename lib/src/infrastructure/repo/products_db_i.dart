import '../infrastructure.dart';

class ProductParam {
  const ProductParam({
    this.page = 1,
    this.limit = 25,
    this.foodCategory,
    this.isFavorite = false,
    this.isMyCart = false,
  });

  final int page;
  final int limit;
  final String? foodCategory;
  final bool isFavorite;
  final bool isMyCart;
}

class ProductState {
  ProductState({
    required this.data,
    required this.totalItem,
  });

  static ProductState none = ProductState(data: [], totalItem: 0);

  final List<ProductModel> data;
  final int totalItem;
}

abstract class IProductDatabase {
  const IProductDatabase();

  Stream<ProductState> getProducts(ProductParam param);
  Future<ProductModel> addOnSaved(ProductModel model);
  Future<ProductModel> removeFromSaved(ProductModel model);

  Future<ProductModel> addToCart(ProductModel model);
}
