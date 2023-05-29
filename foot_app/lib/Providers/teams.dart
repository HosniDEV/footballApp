import 'package:flutter/material.dart';

import '../Models/leagues.dart';
import '../Models/team.dart';
import '../Services/leagues_service.dart';
import '../Services/teams_services.dart';

class TeamProvider extends ChangeNotifier {
  List<TeamInformation> team = [];
  List<TeamInformation> get teamP => team;
  TeamsSer teamsSer = TeamsSer();
  bool isLoading = false;

  getTeam(int? id) async {
    isLoading = true;

    team = await teamsSer.getData(id);

    isLoading = false;
    notifyListeners();
  }
}
