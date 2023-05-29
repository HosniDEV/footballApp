import '../Models/leagues.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/rounds.dart';

class RoundsSer {
  Future<Rounds> roundsData(int? id) async {
    var url =
        'https://v3.football.api-sports.io/fixtures/rounds?league=$id&season=2022';
    Map<String, String> header = {
      "x-rapidapi-host": "v3.football.api-sports.io",
      "x-rapidapi-key": 'c75719e8602a834fbe925b72e2bcb4ac',
    };
    var response = await http.get(Uri.parse(url), headers: header);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      // print(jsonResponse['response']);
      // print(jsonResponse);
      var get = Rounds.fromJson(jsonResponse);
      // print(get.response![0]);
      return get;
    } else {
      throw Exception('failed to get data');
    }
  }
}
