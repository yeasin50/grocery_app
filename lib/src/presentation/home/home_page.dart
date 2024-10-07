import 'dart:async';

import 'package:flutter/material.dart';
import '../../app/route_config.dart';
import '../../infrastructure/infrastructure.dart';
import '../../infrastructure/repo/app_repo.dart';
import '../_common/_common.dart';
import 'widgets/discount_card_view.dart';
import 'widgets/home_filter_tab.dart';

import '../_common/widgets/item_card_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ShopProvider.of(context).fetchItem(ProductParam());
    });
  }

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
                onTap: () async {},
              ),
              const SizedBox(height: 24),
              const HomeFilterTabs(),
              const SizedBox(height: 24),
            ],
          ),
        ),
        StreamBuilder<ProductState>(
            stream: ShopProvider.of(context).stream,
            builder: (context, snapshot) {
              debugPrint("refetching the stream");
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
              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: pState.filterData.length,
                  itemBuilder: (context, index) {
                    return ItemCardView(
                      model: pState.data[index],
                      onTap: () {
                        context.push(AppRoute.productDetails, extra: ProductModel.ui);
                      },
                    );
                  },
                ),
              );
            })
      ],
    );
  }
}
