import '../Models/leagues.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LeaguesSer {
  Future<List<LeaguesModel>> leagueData() async {
    var url = 'https://v3.football.api-sports.io/leagues';
    Map<String, String> header = {
      "x-rapidapi-host": "v3.football.api-sports.io",
      "x-rapidapi-key": 'c75719e8602a834fbe925b72e2bcb4ac',
    };
    var response = await http.get(Uri.parse(url), headers: header);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      // print(jsonResponse['response']);
      var get = (jsonResponse['response'] as List)
          .map((e) => LeaguesModel.fromJson(e))
          .toList();

      return get;
    } else {
      throw Exception('failed to get data');
    }
  }
}
