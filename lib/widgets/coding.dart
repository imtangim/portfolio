import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/models/secrets.dart';
import 'package:portfolio/widgets/animatedlinearprogressbar.dart';

class Coding extends StatelessWidget {
  const Coding({
    super.key,
  });
  Future<List<Map<String, dynamic>>> fetchAndCalculateLanguages() async {
    String username = "imtangim";
    final response = await http.get(
      Uri.parse('https://api.github.com/users/$username/repos'),
     headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> repositories = json.decode(response.body);

      final Map<String, int> languageCounts = {};

      for (var repo in repositories) {
        final language = repo['language'];
        if (language != null) {
          languageCounts[language] = (languageCounts[language] ?? 0) + 1;
        }
      }

      final totalRepositories = repositories.length;
      final List<Map<String, dynamic>> languageDataList = [];

      languageCounts.forEach((language, count) {
        final percentage = (count / totalRepositories);
        final languageData = {
          'languageName': language,
          'language_percentage': percentage,
        };
        languageDataList.add(languageData);
      });

      // Sort the languageDataList by percentage in descending order (top languages first).
      languageDataList.sort((a, b) =>
          b['language_percentage'].compareTo(a['language_percentage']));

      return languageDataList;
    } else {
      throw Exception(
          'Failed to load GitHub repositories. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            "Coding",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        FutureBuilder(
          future: fetchAndCalculateLanguages(),
          initialData: "Loading",
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Text("Loading")
                  : snapshot.hasData
                      ? SizedBox(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: 7,
                            itemBuilder: (context, index) {
                              final languageDataList =
                                  snapshot.data as List<Map<String, dynamic>>;
                              final languageData = languageDataList[index];
                              final languageName = languageData['languageName'];
                              final percentage =
                                  languageData['language_percentage'];

                              return AnimatedLinearProgreessbar(
                                  name: languageName, mainvalue: percentage);
                            },
                          ),
                        )
                      : const Text("Loading.."),
        )
      ],
    );
  }
}
