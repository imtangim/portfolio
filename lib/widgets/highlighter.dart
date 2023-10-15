import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class HighLight extends StatelessWidget {
  const HighLight({
    super.key,
    required this.counter,
    this.label,
  });
  final Widget counter;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        counter,
        const SizedBox(
          width: defaultPadding / 2,
        ),
        Text(
          label.toString(),
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }
}
