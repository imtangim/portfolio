import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/models/secrets.dart';

import 'package:portfolio/widgets/animatecounter.dart';

import 'package:portfolio/widgets/highlighter.dart';

class CounterBar extends StatelessWidget {
  const CounterBar({super.key});
  Future<int> fetchGitHubRepos() async {
    const username = 'imtangim';

    final response = await http.get(
      Uri.parse('https://api.github.com/users/$username/repos'),
      headers: {'Authorization': 'Bearer $token'},
    );
    dynamic data = json.decode(response.body);
    if (response.statusCode == 200) {
      // Parse and return the JSON data.
      return data.length;
    } else {
      throw Exception('Failed to load GitHub repositories');
    }
  }

  Future<int> subcribercounter() async {
    final response = await http.get(
      Uri.parse(
          'https://www.googleapis.com/youtube/v3/channels?part=statistics&id=UCoI_FhiiPUjTqKf07XQ80dA&key=AIzaSyAN9pmiEdVfb9N927QllQWYE-_8lmWAXQQ'),
    );
    dynamic data = json.decode(response.body);
    if (response.statusCode == 200) {
      // Parse and return the JSON data.
      return int.parse(data['items'][0]["statistics"]['subscriberCount']);
    } else {
      throw Exception('Failed to load GitHub repositories');
    }
  }

  Future<int> videocount() async {
    final response = await http.get(
      Uri.parse(
          'https://www.googleapis.com/youtube/v3/channels?part=statistics&id=UCoI_FhiiPUjTqKf07XQ80dA&key=AIzaSyAN9pmiEdVfb9N927QllQWYE-_8lmWAXQQ'),
    );
    dynamic data = json.decode(response.body);
    if (response.statusCode == 200) {
      // Parse and return the JSON data.
      return int.parse(data['items'][0]["statistics"]['videoCount']);
    } else {
      throw Exception('Failed to load GitHub repositories');
    }
  }

  Future<int> getGitHubStarsCount(String accessToken) async {
    final headers = {
      'Authorization': 'token $accessToken',
      'Accept': 'application/vnd.github.v3+json',
    };

    try {
      final response = await http.get(
        Uri.parse('https://api.github.com/user'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final starsUrl = data['starred_url'].split('{')[0];
        final username = data['login'];
        final starsCount = await fetchStarsCount(username, starsUrl, headers);
        return starsCount;
      } else {
        throw Exception(
            'Failed to retrieve data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch stars count: $e');
    }
  }

  Future<int> fetchStarsCount(
      String username, String starsUrl, Map<String, String> headers) async {
    try {
      final response = await http.get(
        Uri.parse(starsUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data.length;
      } else {
        throw Exception(
            'Failed to retrieve starred repositories. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch starred repositories: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FutureBuilder(
            future: subcribercounter(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const HighLight(
                  counter: AnimatedCounter(data: 0, text: "+"),
                  label: "Subscriber",
                );
              } else if (snapshot.hasData) {
                int num = snapshot.data!;
                return HighLight(
                  counter: AnimatedCounter(data: num, text: "+"),
                  label: "Subscriber",
                );
              } else {
                return Container();
              }
            },
          ),
          const SizedBox(
            width: defaultPadding,
          ),
          FutureBuilder(
            future: fetchGitHubRepos(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const HighLight(
                  counter: AnimatedCounter(data: 0, text: "+"),
                  label: "Projects",
                );
              } else if (snapshot.hasData) {
                int num = snapshot.data!;
                return HighLight(
                  counter: AnimatedCounter(data: num, text: "+"),
                  label: "Projects",
                );
              } else {
                return Container();
              }
            },
          ),
          const SizedBox(
            width: defaultPadding,
          ),
          FutureBuilder(
            future: videocount(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const HighLight(
                  counter: AnimatedCounter(data: 0, text: "+"),
                  label: "Videos",
                );
              } else if (snapshot.hasData) {
                int num = snapshot.data!;
                return HighLight(
                  counter: AnimatedCounter(data: num, text: "+"),
                  label: "Videos",
                );
              } else {
                return Container();
              }
            },
          ),
          FutureBuilder(
            future: getGitHubStarsCount(token),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const HighLight(
                  counter: AnimatedCounter(data: 1, text: "+"),
                  label: "Stars",
                );
              } else if (snapshot.hasData) {
                int num = snapshot.data!;
                return HighLight(
                  counter: AnimatedCounter(data: num, text: "+"),
                  label: "Stars",
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
