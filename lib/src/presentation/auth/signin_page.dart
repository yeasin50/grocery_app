import 'package:flutter/material.dart';
import 'package:grocery_app/src/app/app_theme.dart';
import 'package:grocery_app/src/presentation/_common/app_text_field.dart';

import 'widgets/background_auth_wrapper.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    const gap = SizedBox(height: 24);
    return AuthBackGroundWrapper(
      child: Material(
        color: AppTheme.background,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              gap,
              FractionallySizedBox(
                widthFactor: .5,
                child: Container(
                  height: 4,
                  decoration: const ShapeDecoration(
                    shape: StadiumBorder(),
                    color: AppTheme.primary,
                  ),
                ),
              ),
              gap,
              Text(
                "Create an account now",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              gap,
              const AppTextField(
                hint: "Name",
                icon: Icon(Icons.person),
              ),
              gap,
              const AppTextField(
                hint: "Email",
                icon: Icon(Icons.email_outlined),
              ),
              gap,
              const AppTextField(
                hint: "Password",
                icon: Icon(Icons.visibility),
              ),
              gap,
              const AppTextField(
                hint: "Confirm Password",
                icon: Icon(Icons.visibility),
              ),
              gap,
              gap,
            ],
          ),
        ),
      ),
    );
  }
}
