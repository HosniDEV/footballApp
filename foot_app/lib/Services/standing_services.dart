import '../Models/standings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StandingSer {
  Future<List<Global>> getStanding(int? id) async {
    var url =
        'https://v3.football.api-sports.io/standings?league=$id&season=2022';
    Map<String, String> header = {
      "x-rapidapi-host": "v3.football.api-sports.io",
      "x-rapidapi-key": 'c75719e8602a834fbe925b72e2bcb4ac',
    };
    var response = await http.get(Uri.parse(url), headers: header);
    List<Global> list = [];
    if (response.statusCode == 200) {
      List res = jsonDecode(response.body)['response'];

      // res.forEach((element) => Global.fromJson(element));
      return res.map((e) => Global.fromJson(e)).toList();
    } else {
      throw Exception('failed to load data from the server');
    }
  }
}
