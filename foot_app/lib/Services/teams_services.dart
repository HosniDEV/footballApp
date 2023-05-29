import '../Models/team.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TeamsSer {
  Future<List<TeamInformation>> getData(int? id) async {
    var url = 'https://v3.football.api-sports.io/teams?league=$id&season=2022';
    Map<String, String> header = {
      "x-rapidapi-host": "v3.football.api-sports.io",
      "x-rapidapi-key": 'c75719e8602a834fbe925b72e2bcb4ac',
    };
    List<Team> myList = [];
    var response = await http.get(Uri.parse(url), headers: header);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      return (jsonResponse['response'] as List)
          .map((e) => TeamInformation.fromJson(e))
          .toList();
    } else {
      throw Exception('failed to load data from the server');
    }
  }
}
