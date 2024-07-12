import 'package:flutter/material.dart';

class CircleMilestonWidget extends StatelessWidget {
  final Color color;
  final double radius;
  const CircleMilestonWidget({
    super.key,
    required this.color,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: color,
      child: CircleAvatar(
        radius: radius < 2 ? 0 : radius * .75,
        backgroundColor: Theme.of(context).colorScheme.background,
        child: CircleAvatar(
          radius: radius < 4 ? 0 : radius * .5,
          backgroundColor: color,
        ),
      ),
    );
  }
}
