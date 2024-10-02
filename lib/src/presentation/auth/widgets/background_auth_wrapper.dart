import 'package:flutter/material.dart';
import 'package:grocery_app/src/app/app_theme.dart';

class AuthBackGroundWrapper extends StatelessWidget {
  const AuthBackGroundWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    const url = "https://images.pexels.com/photos/4020557/pexels-photo-4020557.jpeg";
    return Stack(
      fit: StackFit.expand,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.network(
            url,
            fit: BoxFit.fitWidth,
          ),
        ),
        Align(alignment: Alignment.topCenter, child: AppBar()),
        Align(
          alignment: Alignment.bottomCenter,
          child: child,
        )
      ],
    );
  }
}
