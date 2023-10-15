import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:portfolio/models/secrets.dart';

class ProjectandRecomdentaion {
  final username = 'imtangim';

  Future<List<dynamic>> projects() async {
    final response = await http.get(
      Uri.parse('https://api.github.com/users/$username/repos'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      // Parse and return the JSON data.
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load GitHub repositories');
    }
  }

  Future<List<dynamic>> recomendation() async {
    final response = await http.get(
      Uri.parse(
          'https://gh-pinned-repos.egoist.dev/?username=$username'), // Use this API to get pinned repos
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load pinned repositories');
    }
  }
}
