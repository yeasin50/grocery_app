import 'package:flutter/material.dart';

///  create bubble for [BackgroundView]
///
class BackgroundBubble extends StatelessWidget {
  const BackgroundBubble({
    super.key,
    this.colors = const [
      Color.fromRGBO(255, 60, 60, 0.5),
      Color.fromRGBO(255, 60, 60, 0),
    ],
    this.radius = 1,
    this.size = const Size(200, 200),
    required this.alignment,
  });

  final List<Color> colors;
  final double radius;
  final Size size;

  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: SizedBox.fromSize(
        size: size,
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: colors,
              stops: [0, 2],
            ),
          ),
        ),
      ),
    );
  }
}
