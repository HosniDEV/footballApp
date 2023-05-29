// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:foot_app/Models/team.dart';

class FixturesG {
  Fixtures? fixtures;
  TeamsFix? team;
  FixturesG({
    this.fixtures,
    this.team,
  });

  factory FixturesG.fromJson(Map<String, dynamic> json) {
    return FixturesG(
      fixtures:
          json['fixture'] != null ? Fixtures.fromJson(json['fixture']) : null,
      team: json['teams'] != null ? TeamsFix.fromJson(json['teams']) : null,
    );
  }
}

class Fixtures {
  int? id;
  String? date;
  String? status;
  String? vanueName;
  String? vanueCity;
  Fixtures({
    this.id,
    this.date,
    this.status,
    this.vanueName,
    this.vanueCity,
  });

  factory Fixtures.fromJson(Map<String, dynamic> json) {
    return Fixtures(
      id: json['id'],
      date: json['date'],
      status: json['status']['long'],
      vanueName: json['venue']['name'],
      vanueCity: json['venue']['city'],
    );
  }
}

class TeamsFix {
  TeamsF? home;
  TeamsF? away;
  TeamsFix({
    this.home,
    this.away,
  });

  factory TeamsFix.fromJson(Map<String, dynamic> json) {
    return TeamsFix(
      home: json['home'] != null ? TeamsF.fromJson(json['home']) : null,
      away: json['away'] != null ? TeamsF.fromJson(json['away']) : null,
    );
  }
}

class TeamsF {
  int? id;
  String? name;
  String? logo;
  bool? winner;
  TeamsF({
    this.id,
    this.name,
    this.logo,
    this.winner,
  });

  factory TeamsF.fromJson(Map<String, dynamic> json) {
    return TeamsF(
      id: json['id'] != null ? json['id'] as int : null,
      name: json['name'] != null ? json['name'] as String : null,
      logo: json['logo'] != null ? json['logo'] as String : null,
      winner: json['winner'] != null ? json['winner'] as bool : null,
    );
  }
}
