enum ItemCategoryType {
  all,
  fruits,
  vegetables,
  dairyProducts,
  ;
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
