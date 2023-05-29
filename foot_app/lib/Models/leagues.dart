import 'countries.dart';

class LeaguesModel {
  League? league;
  CountryModel? country;

  LeaguesModel({
    this.league,
    this.country,
  });
  factory LeaguesModel.fromJson(Map<String, dynamic> json) {
    return LeaguesModel(
      league: json['league'] != null ? League.fromJson(json['league']) : null,
      country: json['country'] != null
          ? CountryModel.fromJson(json['country'])
          : null,
    );
  }
}

class League {
  int? id;
  String? name;
  String? type;
  String? logo;
  League({
    this.name,
    this.logo,
    this.type,
    this.id,
  });
  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      name: json["name"],
      logo: json["logo"],
      type: json["type"],
      id: json['id'],
    );
  }
}
