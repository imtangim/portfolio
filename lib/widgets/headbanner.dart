import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/responsive.dart';

class HeadBanner extends StatelessWidget {
  const HeadBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Responsive.isMobile(context) ? 1.5 : 3,
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
                  style: Responsive.isMobile(context)
                      ? Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )
                      : Responsive.isDesktop(context)
                          ? Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )
                          : Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                ),
                if (Responsive.isMobileLarge(context))
                  const SizedBox(
                    height: defaultPadding / 2,
                  ),
                const MyBuildAnimated(),
                const SizedBox(
                  height: defaultPadding,
                ),
                if (!Responsive.isMobileLarge(context))
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
  double calculateDynamicFontSize(BuildContext context, double baseSize) {
    // Get the screen width (or height, depending on your preference).
    double screenWidth = MediaQuery.of(context).size.width;

    // Define a reference screen width (or height) to calculate a scaling factor.
    const referenceScreenWidth =
        280.0; // Change this to your preferred reference.

    // Calculate the scaling factor.
    double scaleFactor = screenWidth / referenceScreenWidth;

    // Calculate the dynamic font size.
    return baseSize * scaleFactor;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      maxLines: 2,
      style: Theme.of(context).textTheme.titleMedium!,
      child: Row(
        children: [
          if (!Responsive.isMobileLarge(context)) const flutterText(),
          if (!Responsive.isMobileLarge(context))
            const SizedBox(
              width: defaultPadding / 2,
            ),
          Responsive.isMobile(context)
              ? Container()
              : Text(
                  "I build ",
                  style: TextStyle(
                      fontSize: calculateDynamicFontSize(context, 13)),
                ),
          Responsive.isMobile(context)
              ? const Expanded(child: AnimateText())
              : const AnimateText(),
          if (!Responsive.isMobileLarge(context))
            const SizedBox(
              width: defaultPadding / 2,
            ),
          if (!Responsive.isMobileLarge(context)) const flutterText(),
        ],
      ),
    );
  }
}

class AnimateText extends StatelessWidget {
  const AnimateText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
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
