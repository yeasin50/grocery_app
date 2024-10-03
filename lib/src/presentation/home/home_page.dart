import 'package:flutter/material.dart';
import 'package:grocery_app/src/app/app_theme.dart';
import '../../infrastructure/models/item_model.dart';
import '../_common/_common.dart';
import 'widgets/discount_card_view.dart';
import 'widgets/home_filter_tab.dart';
import 'widgets/user_profile_header_view.dart';

import '../_common/widgets/item_card_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundView.triple(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomScrollView(
            slivers: [
              SliverList.list(
                children: [
                  const SizedBox(height: kToolbarHeight / 2),
                  const UserProfileHeaderView(),
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

              ///

              SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ItemCardView(
                    model: ItemModel.ui,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
