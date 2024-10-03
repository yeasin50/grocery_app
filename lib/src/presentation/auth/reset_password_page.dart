import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/src/app/route_config.dart';
import 'package:grocery_app/src/presentation/auth/signin_page.dart';

import '../_common/widgets/app_text_field.dart';
import 'auth.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    const gap = SizedBox(height: 24);
    final textTheme = Theme.of(context).textTheme;
    return AuthBackGroundWrapper(
      title: "Verification",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Enter your email here ! we will send you verification code.",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          const AppTextField(
            hint: "Email",
            icon: Icon(Icons.email),
          ),
          const SizedBox(height: 32),
          FractionallySizedBox(
            widthFactor: .75,
            child: SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  context.push(AppRoute.otp);
                },
                child: const Text("Send Code"),
              ),
            ),
          ),
          gap,
        ],
      ),
    );
  }
}
