import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/models/secrets.dart';
import 'package:portfolio/widgets/flickinglayoutforproject.dart';
import 'package:portfolio/widgets/projectcard.dart';

class MyProjects extends StatelessWidget {
  const MyProjects({super.key});
  Future<List<dynamic>> fetchGitHubRepos() async {
   
    final response = await http.get(
      Uri.parse(
          'https://api.github.com/users/imtangim/repos?sort=created&direction=desc'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      // Parse and return the JSON data.
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load GitHub repositories');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Projects",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: defaultPadding),
        FutureBuilder(
          future: fetchGitHubRepos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const flickingLayoutforprojects();
            } else if (!snapshot.hasData) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 200,
                  maxWidth: MediaQuery.of(context).size.width * 0.2,
                ),
                child: Center(
                  child: Text(
                    "No project available",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              );
            } else if (snapshot.hasData) {
              List data = snapshot.data!;

              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.4,
                  crossAxisSpacing: defaultPadding,
                  mainAxisSpacing: defaultPadding,
                ),
                itemBuilder: (context, index) {
                  if (index < 8) {
                    String title = data[index]["name"].toString();
                    String fulltitle = data[index]["full_name"].toString();
                    String description = data[index]["description"].toString();
                    String url = data[index]["html_url"].toString();
                    String language = data[index]["languages_url"].toString();

                    List<String> mainTitle = title.split("_");
                    mainTitle[0] = (mainTitle[0].split("")[0].toUpperCase() +
                        mainTitle[0].substring(1));
                    String fixedText = mainTitle.join(" ");

                    return ProjectCard(
                      fulltile: fulltitle,
                      fixedText: fixedText,
                      description: description,
                      url: url,
                      language: language,
                    );
                  } else if (index == 8) {
                    // This is the last item, return the IconButton
                    return FittedBox(
                      fit: BoxFit.none,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                          backgroundColor: primaryColor,
                          foregroundColor: secondaryColor,
                        ),
                        child: const Row(
                          children: [
                            Text("See more "),
                            Icon(Icons.arrow_forward),
                          ],
                        ), // Replace with the desired icon
                        onPressed: () {
                          // Handle button click action here
                        },
                      ),
                    );
                  } else {
                    // Handle other cases if needed
                    return const SizedBox(); // Placeholder
                  }
                },
              );
            } else {
              return Container();
            }
          },
        )
      ],
    );
  }
}
