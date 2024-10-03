import 'package:grocery_app/src/infrastructure/enums/filter_tab_enum.dart';

class ItemModel {
  const ItemModel({
    required this.type,
    required this.name,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.isSaved,
  });
  static const imagePath = "https://avatars.githubusercontent.com/u/46500228?v=4";

  static ItemModel get ui => const ItemModel(
        type: ItemCategoryType.fruits,
        name: "Orange",
        price: 6.0,
        rating: 3.5,
        imageUrl: imagePath,
        isSaved: false,
      );

  final ItemCategoryType type;
  final String name;
  final double price;
  final double rating;
  final String imageUrl;
  final bool isSaved;
}
