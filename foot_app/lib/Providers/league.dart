import 'package:flutter/material.dart';

import '../Models/leagues.dart';
import '../Services/leagues_service.dart';

class LeagueProvider extends ChangeNotifier {
  List<LeaguesModel> league = [];
  List<LeaguesModel> get leagueP => league;
  LeaguesSer leaguesSer = LeaguesSer();
  bool isLoading = false;

  getLeague() async {
    isLoading = true;

    league = await leaguesSer.leagueData();

    isLoading = false;
    notifyListeners();
  }
}
