import 'package:flutter/material.dart';
import 'package:grocery_app/src/app/app_theme.dart';

class UserProfileHeaderView extends StatelessWidget {
  const UserProfileHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    const imagePath = "https://avatars.githubusercontent.com/u/46500228?v=4";

    String name = "Yeasin";
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text(
              "Hey $name!",
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notification_important_rounded),
              color: AppTheme.primary,
            ),
            Material(
              shape: const CircleBorder(
                side: BorderSide(color: AppTheme.primary),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                imagePath,
                height: 48,
                width: 48,
              ),
            )
          ],
        ),
        const Text("What do you like to find?")
      ],
    );
  }
}
