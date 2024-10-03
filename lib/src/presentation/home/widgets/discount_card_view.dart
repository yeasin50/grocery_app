import 'package:flutter/material.dart';
import 'package:grocery_app/src/app/app_theme.dart';
import 'package:grocery_app/src/presentation/_common/widgets/app_button.dart';

class DiscountCardView extends StatelessWidget {
  const DiscountCardView({
    super.key,
    required this.discount,
    this.onTap,
  });

  final int discount;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final color = Color(0x18F1EEEE);

    return AspectRatio(
      aspectRatio: 16 / 8,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Color.fromARGB(73, 127, 120, 120),
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      "Flat $discount% off",
                      style: textTheme.bodyLarge?.copyWith(color: AppTheme.primary),
                    ),
                    Text(
                      "Discount",
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "on first order",
                      style: textTheme.bodyLarge?.copyWith(),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppButton(label: "view offer", onTap: onTap),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
              const Expanded(
                child: Placeholder(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
