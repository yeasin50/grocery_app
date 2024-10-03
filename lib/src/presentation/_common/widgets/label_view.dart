import 'package:flutter/material.dart';

import '../../../app/app_theme.dart';

class LabelView extends StatelessWidget {
  const LabelView({
    super.key,
    required this.label,
  });
  final String label;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.primary,
      shape: StadiumBorder(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
