import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/src/app/route_config.dart';
import '../../infrastructure/models/item_model.dart';
import '../_common/_common.dart';
import 'widgets/discount_card_view.dart';
import 'widgets/home_filter_tab.dart';

import '../_common/widgets/item_card_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          sliver: SliverList.list(
            children: [
              const SizedBox(height: 24),
              DiscountCardView(
                discount: 50,
                onTap: () {},
              ),
              const SizedBox(height: 24),
              const HomeFilterTabs(),
              const SizedBox(height: 24),
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          sliver: SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: 5,
            itemBuilder: (context, index) {
              return ItemCardView(
                model: ItemModel.ui,
                onTap: () {
                  context.push(AppRoute.productDetails, extra: ItemModel.ui);
                },
              );
            },
          ),
        )
      ],
    );
  }
}
