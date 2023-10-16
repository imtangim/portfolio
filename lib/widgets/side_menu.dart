import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:portfolio/components/myinfo.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/widgets/area_info.dart';
import 'package:portfolio/widgets/coding.dart';
import 'package:portfolio/widgets/knowledgebar.dart';
import 'package:portfolio/widgets/skills.dart';
import 'package:url_launcher/url_launcher.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  Future<void> downloadFile(_url) async {
    final Uri url = Uri.parse(_url);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  void openLink(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const MyInfo(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    const AreaInfo(title: "Residence", text: "Bangladesh"),
                    const AreaInfo(title: "City", text: "Dhaka"),
                    const AreaInfo(title: "Age", text: "23"),
                    const Skills(),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    const Coding(),
                    const Knowledgepanel(),
                    const Divider(),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color(0xFF24242E),
                        ),
                        foregroundColor: MaterialStatePropertyAll(
                          Colors.white,
                        ),
                      ),
                      onPressed: () {
                        downloadFile(
                            "https://github.com/imtangim/protfolio/raw/main/Tangim2.pdf");
                      },
                      child: FittedBox(
                        child: Row(
                          children: [
                            Text(
                              "Download CV",
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .color),
                            ),
                            const SizedBox(
                              width: defaultPadding / 2,
                            ),
                            SvgPicture.asset(
                              "assets/icons/download.svg",
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: defaultPadding / 2),
                      color: const Color(0xFF24242E),
                      child: Row(
                        children: [
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              openLink(
                                  "https://www.linkedin.com/in/tangimhere/");
                            },
                            icon: SvgPicture.asset(
                              "assets/icons/linkedin.svg",
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              openLink("https://github.com/imtangim");
                            },
                            icon: SvgPicture.asset(
                              "assets/icons/github.svg",
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              openLink("https://www.facebook.com/imtanjimh");
                            },
                            icon: SvgPicture.asset(
                              "assets/icons/facebook.svg",
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
