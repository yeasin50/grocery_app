enum ItemCategoryType {
  all,
  fruits,
  vegetables,
  dairyProducts,
  ;

  static ItemCategoryType fromMap(String str) {
    return switch (str.toLowerCase()) {
      'fruits' => ItemCategoryType.fruits,
      'vegetable' => ItemCategoryType.vegetables,
      'dairy_products' => ItemCategoryType.dairyProducts,
      _ => ItemCategoryType.all,
    };
  }
}

extension FilterTabExt on ItemCategoryType {

  String get title {
    return switch (this) {
      ItemCategoryType.all => "All",
      ItemCategoryType.fruits => "Fruits",
      ItemCategoryType.vegetables => "Vegetables",
      ItemCategoryType.dairyProducts => "DairyProducts",
    };
  }

  String? get imageIcon {
    //todo: will work this later
    return switch (this) {
      ItemCategoryType.all => "All",
      ItemCategoryType.fruits => "Fruits",
      ItemCategoryType.vegetables => "Vegetables",
      ItemCategoryType.dairyProducts => "DairyProducts",
    };
  }
}
