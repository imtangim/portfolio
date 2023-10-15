import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class HeadBanner extends StatelessWidget {
  const HeadBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/bg.jpeg",
            fit: BoxFit.cover,
          ),
          Container(
            color: darkColor.withOpacity(0.66),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Discover my Amazing\nArt Space",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
                const MyBuildAnimated(),
                const SizedBox(
                  height: defaultPadding,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding * 2,
                        vertical: defaultPadding,
                      )),
                  onPressed: () {},
                  child: const Text(
                    "Explore now",
                    style: TextStyle(
                      color: darkColor,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyBuildAnimated extends StatelessWidget {
  const MyBuildAnimated({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.titleMedium!,
      child: Row(
        children: [
          const flutterText(),
          const SizedBox(
            width: defaultPadding / 2,
          ),
          const Text("I build "),
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                "responsive web and mobile app.",
                speed: const Duration(milliseconds: 60),
              ),
              TyperAnimatedText(
                "complete e-Commerce app UI.",
                speed: const Duration(milliseconds: 60),
              ),
              TyperAnimatedText(
                "Chat app with dark and light theme.",
                speed: const Duration(milliseconds: 60),
              ),
              TyperAnimatedText(
                "App that need Map integration.",
                speed: const Duration(milliseconds: 60),
              ),
            ],
          ),
          const SizedBox(
            width: defaultPadding / 2,
          ),
          const flutterText(),
        ],
      ),
    );
  }
}

class flutterText extends StatelessWidget {
  const flutterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        text: "<",
        children: [
          TextSpan(
            text: "flutter",
            style: TextStyle(color: primaryColor),
          ),
          TextSpan(text: "> "),
        ],
      ),
    );
  }
}
