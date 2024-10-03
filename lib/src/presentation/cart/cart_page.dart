import 'package:flutter/material.dart';
import 'package:grocery_app/src/infrastructure/infrastructure.dart';
import 'package:grocery_app/src/presentation/_common/widgets/background_view.dart';
import 'package:grocery_app/src/presentation/_common/widgets/item_card_view.dart';
import 'package:grocery_app/src/presentation/cart/widgets/cart_summary_view.dart';

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
    return BackgroundView.triple(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  const SliverAppBar(
                    title: LabelView(label: "My Cart"),
                    centerTitle: true,
                    floating: true,
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    sliver: SliverList.separated(
                      itemCount: 30,
                      separatorBuilder: (context, index) => const SizedBox(height: 24),
                      itemBuilder: (context, index) => ItemCartView(model: ItemModel.ui),
                    ),
                  )
                ],
              ),
            ),
            const CartSummaryView(),
          ],
        ),
      ),
    );
  }
}
