enum ProductType {
  all,
  fruits,
  vegetables,
  dairyProducts,
  ;

  static ProductType fromMap(String str) {
    return switch (str.toLowerCase()) {
      'fruits' => ProductType.fruits,
      'vegetable' => ProductType.vegetables,
      'dairy_products' => ProductType.dairyProducts,
      _ => ProductType.all,
    };
  }
}

extension FilterTabExt on ProductType {
  String get title {
    return switch (this) {
      ProductType.all => "All",
      ProductType.fruits => "Fruits",
      ProductType.vegetables => "Vegetables",
      ProductType.dairyProducts => "DairyProducts",
    };
  }

  String? get imageIcon {
    //todo: will work this later
    return switch (this) {
      ProductType.all => "All",
      ProductType.fruits => "Fruits",
      ProductType.vegetables => "Vegetables",
      ProductType.dairyProducts => "DairyProducts",
    };
  }
}
