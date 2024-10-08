import 'package:flutter/material.dart';

import '../../../app/route_config.dart';
import '../../../infrastructure/infrastructure.dart';
import 'cart_item_view.dart';

class CartStreamSliverList extends StatelessWidget {
  const CartStreamSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ProductState>(
      stream: ShopProvider.of(context).stream,
      builder: (context, snapshot) {
        debugPrint("refetching the stream ${snapshot.connectionState}");
        if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Text(snapshot.error.toString()),
          );
        }
        if (!snapshot.hasData) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text("A"),
            ),
          );
        }
        final pState = snapshot.data ?? ProductState.none;

        if (pState.filterData.isEmpty) {
          return const SliverFillRemaining(
            child: Center(child: Text("No product found")),
          );
        }
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          sliver: SliverList.builder(
             
            itemCount: pState.filterData.length,
            itemBuilder: (context, index) {
              return ItemCartView(
                model: pState.filterData[index],
                onTap: () {
                  context.push(AppRoute.productDetails, extra: pState.filterData[index]);
                },
              );
            },
          ),
        );
      },
    );
  }
}
