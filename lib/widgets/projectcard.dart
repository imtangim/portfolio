import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

import 'package:shimmer/shimmer.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
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

  void redirectToNewURL(String newURL) {
    html.window.open(newURL, "Read More");
  }

  Future<List<String>> fetchrepolang() async {
    final response = await http.get(
      Uri.parse(language),
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
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(height: 1.5),
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
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(height: 1.5),
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
