import 'package:flutter/material.dart';
import '../../app/app_theme.dart';
import '../../app/route_config.dart';
import '../../infrastructure/infrastructure.dart';
import '../_common/widgets/background_view.dart';
import '../_common/widgets/item_counter.dart';
import 'widgets/product_description.dart';

import '../_common/widgets/app_button.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({
    super.key,
    required this.model,
  });

  final ProductModel model;

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
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: context.pop,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppTheme.borderColor,
            ),
          ),
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
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
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
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverList.list(
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
                      initialValue: widget.model.orderCounter,
                      onChanged: (v) {},
                    ),
                  ),
                  ProductDescription(model: widget.model),
                  const SizedBox(height: 24),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
