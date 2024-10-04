import 'package:flutter/material.dart';
import 'package:grocery_app/src/app/app_theme.dart';
import 'package:grocery_app/src/app/grocery_app.dart';
import 'package:grocery_app/src/app/route_config.dart';
import 'package:grocery_app/src/infrastructure/infrastructure.dart';
import 'package:grocery_app/src/presentation/_common/widgets/background_view.dart';
import 'package:grocery_app/src/presentation/_common/widgets/item_counter.dart';
import 'package:grocery_app/src/presentation/product_detail/widgets/product_description.dart';

import '../_common/widgets/app_button.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({
    super.key,
    required this.model,
  });

  final ItemModel model;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  double price = 20;
  int itemCount = 1;

  String get totalPrice => (price * itemCount).toStringAsFixed(1);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BackgroundView.triple(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Scaffold(
          appBar: AppBar(
            actions: [
              InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.shopping_cart_rounded,
                  color: AppTheme.primary,
                ),
                onTap: () {
                  context.go(AppRoute.cart);
                },
              )
            ],
          ),
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total:\$$totalPrice",
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              AppButton(
                label: "Add to cart",
                onTap: () {
                  ///
                },
              ),
            ],
          ),
          body: CustomScrollView(
            slivers: [
              SliverList.list(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 12,
                    child: Image.network(
                      widget.model.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: ItemCounter(
                      onChanged: (v) {},
                    ),
                  ),
                  ProductDescription(model: widget.model),
                  const SizedBox(height: 24),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
