import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:shimmer/shimmer.dart';

class flickingLayoutforprojects extends StatelessWidget {
  const flickingLayoutforprojects({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 9,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.3,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: secondaryColor,
          highlightColor: darkColor,
          child: Material(
            elevation: 3,
            child: Container(
              color: secondaryColor,
              padding: const EdgeInsets.all(defaultPadding),
            ),
          ),
        );
      },
    );
  }
}
