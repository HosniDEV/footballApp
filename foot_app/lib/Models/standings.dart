import 'team.dart';

class Global {
  League? league;
  Global({
    this.league,
  });
  factory Global.fromJson(Map<String, dynamic> json) {
    return Global(
      league: json['league'] != null ? League.fromJson(json['league']) : null,
    );
  }
}

class League {
  int? id;
  String? name;
  String? country;
  String? logo;
  String? flag;
  int? season;
  List<List<Standing>>? standing;
  League({
    this.id,
    this.name,
    this.country,
    this.logo,
    this.flag,
    this.season,
    this.standing,
  });
  factory League.fromJson(Map<String, dynamic> json) {
    List<List<Standing>>? list = [];
    if (json['standings'] != null) {
      List<dynamic> standingsList = json['standings'];
      standingsList.forEach((standing) {
        List<Standing> innerList = [];
        List<dynamic> innerStandingsList = standing;
        innerStandingsList.forEach((innerStanding) {
          innerList.add(Standing.fromJson(innerStanding));
        });
        list.add(innerList);
      });
    }
    return League(
      id: json["id"],
      name: json["name"],
      country: json["country"],
      logo: json["logo"],
      flag: json["flag"],
      season: json["season"],
      standing: list,
    );
  }
}

class Standing {
  int? rank;
  int? points;
  Team? team;
  Standing({this.rank, this.points, this.team});
  factory Standing.fromJson(Map<String, dynamic> json) {
    return Standing(
      rank: json['rank'],
      points: json['points'],
      team: json['team'] != null ? Team.fromJson(json['team']) : null,
    );
  }
}
