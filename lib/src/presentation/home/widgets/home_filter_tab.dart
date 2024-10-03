import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grocery_app/src/infrastructure/enums/filter_tab_enum.dart';

class HomeFilterTabs extends StatefulWidget {
  const HomeFilterTabs({super.key});

  @override
  State<HomeFilterTabs> createState() => _HomeFilterTabsState();
}

class _HomeFilterTabsState extends State<HomeFilterTabs> {
  ItemCategoryType selectedTab = ItemCategoryType.all;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(scrollbars: false, dragDevices: PointerDeviceKind.values.toSet()),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: ItemCategoryType.values
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    selected: selectedTab == e,
                    label: Text(e.title),
                    onSelected: (value) {
                      selectedTab = e;
                      setState(() {});
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
