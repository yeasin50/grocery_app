import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/src/app/app_theme.dart';
import 'package:grocery_app/src/app/route_config.dart';

import '../../home/widgets/user_profile_header_view.dart';
import 'background_view.dart';

class AppBottomNavbar extends StatefulWidget {
  const AppBottomNavbar({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  State<AppBottomNavbar> createState() => _AppBottomNavbarState();
}

class _AppBottomNavbarState extends State<AppBottomNavbar> {
  int currentIndex = 0;

  void onTap(int index) {
    currentIndex = index;
    setState(() {});
    if (index == 0) {
      context.go(AppRoute.home);
    } else if (index == 1) {
      context.go(AppRoute.search);
    } else if (index == 2) {
      context.go(AppRoute.saved);
    } else if (index == 3) {
      context.go(AppRoute.cart);
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundView.triple(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: AppTheme.primary,
          unselectedItemColor: AppTheme.borderColor,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(color: AppTheme.primary),
          unselectedLabelStyle: TextStyle(color: AppTheme.background),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: UserProfileHeaderView(),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
