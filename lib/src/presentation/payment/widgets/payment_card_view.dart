import 'package:flutter/material.dart';
import 'package:grocery_app/src/app/app_theme.dart';

import '../../../infrastructure/infrastructure.dart';

class PaymentCardView extends StatelessWidget {
  const PaymentCardView({
    super.key,
    required this.type,
    required this.onTap,
    this.isSelected = false,
  });

  final VoidCallback? onTap;
  final PaymentMethodEnum type;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.short4,
      width: 120,
      height: 150,
      decoration: BoxDecoration(
        color: isSelected //
            ? AppTheme.primary.withAlpha(50)
            : const Color(0xFFF2ECEC),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(child: Placeholder()),
          const SizedBox(height: 8),
          Text(
            type.name,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
