import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/widgets/knowledge.dart';

class Knowledgepanel extends StatelessWidget {
  const Knowledgepanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            "Knowledge",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const Knowledge(
          text: "Flutter, Dart",
        ),
        const Knowledge(
          text: "Google Map Api",
        ),
        const Knowledge(
          text: "Rest Api",
        ),
        const Knowledge(
          text: "NodeJs (Basic)",
        ),
        const Knowledge(
          text: "Git/GitHub",
        ),
        const Knowledge(
          text: "SDLC",
        ),
      ],
    );
  }
}
