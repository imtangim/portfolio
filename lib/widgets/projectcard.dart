import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/models/secrets.dart';
import 'package:portfolio/responsive.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:shimmer/shimmer.dart';

// ignore: avoid_web_libraries_in_flutter
// import 'dart:html' as html;
import 'package:http/http.dart' as http;

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.fixedText,
    required this.description,
    // required this.url,
    required this.language,
    required this.url,
    required this.fulltile,
  });

  final String fixedText;
  final String description;
  final String url;
  final String language;
  final String fulltile;

 
  void redirectToNewURL(String newURL) async {
    final Uri url = Uri.parse(newURL);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<List<String>> fetchrepolang() async {
    final response = await http.get(
      Uri.parse(language),
      headers: {'Authorization': 'Bearer $token'},
    );

    dynamic data = json.decode(response.body);
    List<String> keys = data.keys.toList();
    if (response.statusCode == 200) {
      // Parse and return the JSON data.
      return keys;
    } else {
      throw Exception('Failed to load GitHub repositories');
    }
  }

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
    return Material(
      elevation: 3,
      child: Container(
        color: secondaryColor,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fixedText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const Spacer(),
            Text(
              "Title: $fulltile",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  height: 1.5,
                  fontSize: Responsive.isMobile(context)
                      ? calculateDynamicFontSize(context, 13)
                      : 16),
            ),
            const Spacer(),
            Text(
              description == "null" ? "🐱‍🚀" : description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(height: 1.5),
            ),
            const Spacer(),
            FutureBuilder(
              future: fetchrepolang(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Shimmer.fromColors(
                    baseColor: secondaryColor,
                    highlightColor: darkColor,
                    child: const Text("Language Used: }"),
                  );
                } else if (snapshot.hasError) {
                  return const Text("Language Used: }");
                } else {
                  final languages = snapshot.data;

                  final languageText =
                      "Languages Used: ${languages!.join(', ')}";
                  return Text(
                    languageText,
                    maxLines: Responsive.isDesktop(context)
                        ? 3
                        : Responsive.isMobileLarge(context)
                            ? 1
                            : Responsive.isTablet(context)
                                ? 2
                                : Responsive.isMobile(context)
                                    ? 1
                                    : 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        height: 1.5,
                        fontSize: Responsive.isMobile(context)
                            ? calculateDynamicFontSize(context, 13)
                            : 16),
                  );
                }
              },
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                redirectToNewURL(url);
              },
              child: const Text(
                "Read More>>",
                style: TextStyle(color: primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
