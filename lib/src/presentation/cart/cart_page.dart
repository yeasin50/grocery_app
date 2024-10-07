import 'package:flutter/material.dart';

import '../../infrastructure/infrastructure.dart';
import '../_common/_common.dart';
import 'widgets/cart_item_view.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverPadding(
          padding: EdgeInsets.only(bottom: 16, left: 24, right: 24),
          sliver: SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: LabelView(label: "My Cart"),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
          sliver: SliverList.separated(
            itemCount: 30,
            separatorBuilder: (context, index) => const SizedBox(height: 24),
            itemBuilder: (context, index) => ItemCartView(model: ProductModel.ui),
          ),
        )
      ],
      // const CartSummaryView(),
    );
  }
}
