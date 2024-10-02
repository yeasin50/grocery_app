import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/src/app/route_config.dart';
import 'package:grocery_app/src/presentation/_common/widgets/background_view.dart';

class LoginOptionSelectionPage extends StatelessWidget {
  const LoginOptionSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BackgroundView.two(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      "Grocery shopping has never been this much fun ",
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            context.push(AppRoute.signIn);
                          },
                          child: const Text("Login"),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Don't Have an account",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 56,
                        child: OutlinedButton(
                          onPressed: () {
                            context.push(AppRoute.signUp);
                          },
                          child: const Text("Sign Up"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: const Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Placeholder(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
