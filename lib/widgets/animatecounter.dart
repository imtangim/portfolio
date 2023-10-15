import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class AnimatedCounter extends StatelessWidget {
  final int data;
  final String text;
  const AnimatedCounter({
    super.key,
    required this.data,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TweenAnimationBuilder(
          tween: IntTween(begin: 0, end: data),
          duration: const Duration(seconds: 2),
          builder: (context, value, child) => Text(
            "$value$text",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: primaryColor),
          ),
        )
      ],
    );
  }
}
