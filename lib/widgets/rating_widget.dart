import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final int stars;
  final double starSize;

  const RatingWidget({super.key, this.stars = 0, this.starSize = 16});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < stars ? CupertinoIcons.star_fill : CupertinoIcons.star,
          color: Colors.amber,
          size: starSize,
        );
      }),
    );
  }
}
