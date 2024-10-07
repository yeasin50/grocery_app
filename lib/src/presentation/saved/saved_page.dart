import 'package:flutter/material.dart';

import '../../app/route_config.dart';
import '../../infrastructure/infrastructure.dart';
import '../_common/_common.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverPadding(
          padding: EdgeInsets.only(bottom: 16, left: 24, right: 24),
          sliver: SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: LabelView(label: "Favorite"),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 16, left: 24, right: 24),
          sliver: SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: 5,
            itemBuilder: (context, index) {
              return ItemCardView(
                model: ProductModel.ui,
                onTap: () {
                  context.push(AppRoute.productDetails, extra: ProductModel.ui);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
