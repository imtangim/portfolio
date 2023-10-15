import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class AnimatedLinearProgreessbar extends StatelessWidget {
  final String name;
  final double mainvalue;

  const AnimatedLinearProgreessbar({
    super.key,
    required this.name,
    required this.mainvalue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: mainvalue),
        duration: defaultDuration,
        builder: (context, double value, child) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text("${(value * 100).toInt()}%")
              ],
            ),
            const SizedBox(
              height: defaultPadding / 2,
            ),
            LinearProgressIndicator(
              color: primaryColor,
              backgroundColor: darkColor,
              value: value,
            )
          ],
        ),
      ),
    );
  }
}
