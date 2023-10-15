

import 'package:flutter/material.dart';

import 'package:portfolio/constants.dart';
import 'package:portfolio/screens/main_screen.dart';

import 'package:portfolio/widgets/counterbar.dart';

import 'package:portfolio/widgets/headbanner.dart';
import 'package:portfolio/widgets/project.dart';
import 'package:portfolio/widgets/recomendation.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainScreen(
      children: [
        HeadBanner(),
        CounterBar(),
        MyProjects(),
        SizedBox(
          height: defaultPadding,
        ),
        Recomendation(),
      ],
    );
  }
}
