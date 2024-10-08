import 'package:flutter/material.dart';
import 'package:grocery_app/src/infrastructure/enums/page_name.dart';
import 'package:grocery_app/src/infrastructure/infrastructure.dart';

import '../_common/_common.dart';
import 'widgets/mycart_stream_sliver_list.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ShopProvider.of(context, listen: false).onTabChange(PageName.cart);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(bottom: 16, left: 24, right: 24),
          sliver: SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: LabelView(label: "My Cart"),
            ),
          ),
        ),
        CartStreamSliverList()
      ],
      // const CartSummaryView(),
    );
  }
}
