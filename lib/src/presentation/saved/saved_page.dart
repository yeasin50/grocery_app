import 'package:flutter/material.dart';

import '../../app/app_theme.dart';
import '../../infrastructure/infrastructure.dart';
import '../_common/widgets/item_card_view.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 34,
            ),
          ),
          const SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Material(
                color: AppTheme.primary,
                shape: StadiumBorder(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    "Favorite",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
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
    );
  }
}
