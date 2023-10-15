import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/widgets/side_menu.dart';

class MainScreen extends StatelessWidget {
  final List<Widget> children;
  const MainScreen({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: maxWidth),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.19,
              //   child: SideMenu(),
              // ),
              const Expanded(
                flex: 2,
                child: SideMenu(),
              ),
              const SizedBox(
                width: defaultPadding,
              ),
              Expanded(
                flex: 7,
                child: SingleChildScrollView(
                  child: Column(
                    children: [...children],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
