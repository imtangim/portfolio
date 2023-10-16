import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class Recomendation extends StatelessWidget {
  const Recomendation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recomendation",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: SizedBox(
            width: double.maxFinite,
            child: Center(
              child: Text("No recomendation available"),
            ),
          ),
        )
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: List.generate(
        //       3,
        //       (index) => Padding(
        //         padding: const EdgeInsets.only(right: defaultPadding),
        //         child: Container(
        //           width: MediaQuery.of(context).size.width * 0.26,
        //           height: MediaQuery.of(context).size.height * 0.26,
        //           decoration: BoxDecoration(
        //             borderRadius: const BorderRadius.all(Radius.circular(30)),
        //             border: Border.all(style: BorderStyle.none),
        //           ),

        //         ),
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
