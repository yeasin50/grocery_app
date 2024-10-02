import 'dart:ui';

import 'package:flutter/material.dart';

import 'background_bubble.dart';

class BackgroundView extends StatelessWidget {
  const BackgroundView({
    super.key,
    required this.child,
    required this.bubble,
  });

  factory BackgroundView.single({
    required Widget child,
    Key? key,
  }) {
    final bubbles = [const BackgroundBubble(alignment: Alignment(-1.65, -.8))];
    return BackgroundView(bubble: bubbles, key: key, child: child);
  }
  factory BackgroundView.two({
    required Widget child,
    Key? key,
  }) {
    final bubbles = [
      const BackgroundBubble(alignment: Alignment(1.2, -1.1)),
      const BackgroundBubble(alignment: Alignment(-.5, .95))
    ];

    return BackgroundView(
      bubble: bubbles,
      key: key,
      child: child,
    );
  }

  final Widget child;

  final List<BackgroundBubble> bubble;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          for (final b in bubble) b,
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: child,
          ),
        ],
      ),
    );
  }
}
