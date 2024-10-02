import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/src/app/app_theme.dart';
import 'package:grocery_app/src/app/route_config.dart';

import '../_common/_common.dart';
import '../_common/widgets/app_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    const gap = SizedBox(height: 48);

    return BackgroundView.single(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                gap, gap,
                const Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: FractionallySizedBox(
                      widthFactor: .85,
                      child: Placeholder(),
                    ),
                  ),
                ),
                gap,
                //
                Text.rich(
                  TextSpan(
                    text: "Buy ",
                    children: [
                      TextSpan(
                        text: "Grocery",
                        style: textTheme.headlineLarge?.copyWith(
                          color: AppTheme.primary,
                        ),
                      ),
                      const TextSpan(text: " items easily with us")
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: textTheme.headlineLarge?.copyWith(),
                ),
                gap,
                const Text(
                  "If you keep good food in your fridge, you will eat good food",
                  textAlign: TextAlign.center,
                ),
                gap,

                SizedBox(
                  height: 56,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.push(AppRoute.loginOption);
                    },
                    label: const Text("Get Started"),
                    icon: const Icon(Icons.arrow_forward),
                    iconAlignment: IconAlignment.end,
                  ),
                ),
                gap,
                gap,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
