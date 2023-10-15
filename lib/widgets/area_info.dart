import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class AreaInfo extends StatelessWidget {
  final String? title, text;
  const AreaInfo({
    super.key,
    this.title,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title.toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            text.toString(),
          ),
        ],
      ),
    );
  }
}
