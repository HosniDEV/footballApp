import 'package:foot_app/Models/fixtures.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class FixturesSer {
  Future<List<FixturesG>> getFixtures(int? id, String? round) async {
    var url =
        'https://v3.football.api-sports.io/fixtures?league=$id&season=2022&round=$round';
    Map<String, String> header = {
      "x-rapidapi-host": "v3.football.api-sports.io",
      "x-rapidapi-key": 'c75719e8602a834fbe925b72e2bcb4ac',
    };

    var response = await http.get(Uri.parse(url), headers: header);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      // print(jsonResponse);
      var get = (jsonResponse['response'] as List)
          .map((e) => FixturesG.fromJson(e))
          .toList();
      // print(get[0].fixtures!.id);
      return get;
    } else {
      throw Exception('failed to load data from the server');
    }
  }
}
