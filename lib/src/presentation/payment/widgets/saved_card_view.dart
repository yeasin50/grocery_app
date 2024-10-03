import 'package:flutter/material.dart';
import 'package:grocery_app/src/app/app_theme.dart';
import 'package:grocery_app/src/infrastructure/infrastructure.dart';
import 'package:grocery_app/src/infrastructure/models/user_payment_method.dart';
import 'package:grocery_app/src/presentation/cart/cart_page.dart';

class UserSavedItemView extends StatelessWidget {
  const UserSavedItemView({
    super.key,
    required this.info,
    required this.isSelected,
    this.onTap,
  });

  final UserPaymentMethod info;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected //
              ? AppTheme.primary.withAlpha(75)
              : const Color(0xFFF2ECEC),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  info.type.title,
                ),
                const SizedBox(height: 12),
                const SizedBox(
                  width: 120,
                  height: 85,
                  child: Placeholder(),
                ),
              ],
            ),
            const SizedBox(width: 24),
            Text(info.cardNo),
            Icon(
              Icons.check_circle,
              color: isSelected ? AppTheme.primary : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
