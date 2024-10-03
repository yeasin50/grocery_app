import 'package:grocery_app/src/infrastructure/enums/filter_tab_enum.dart';

class ItemModel {
  const ItemModel({
    required this.type,
    required this.name,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.isSaved,
    required this.reviewCounter,
    required this.description,
    required this.deliveryTime,
    this.orderCounter = 0,
    this.unit = "per kg",
  });
  static const imagePath = "https://avatars.githubusercontent.com/u/46500228?v=4";

  static ItemModel get ui => ItemModel(
        type: ItemCategoryType.fruits,
        name: "Orange",
        price: 6.0,
        rating: 3.5,
        imageUrl: imagePath,
        isSaved: false,
        reviewCounter: 4500,
        description: "This is a product desc" * 33,
        deliveryTime: "30-35 minutes",
        orderCounter: 1,
      );

  final ItemCategoryType type;
  final String name;
  final double price;
  final double rating;
  final String imageUrl;
  final bool isSaved;
  final int reviewCounter;
  final String description;
  final String deliveryTime;
  final int orderCounter;
  final String unit;
}
