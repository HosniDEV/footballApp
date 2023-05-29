import 'package:flutter/material.dart';

import '../Models/leagues.dart';
import '../Models/rounds.dart';
import '../Models/team.dart';
import '../Services/leagues_service.dart';
import '../Services/rounds_services.dart';
import '../Services/teams_services.dart';

class RoundsProvider extends ChangeNotifier {
  Rounds round = Rounds(response: []);
  Rounds get rounds => round;
  RoundsSer roundsSer = RoundsSer();
  bool isLoading = false;
  int index = 1;
  int get indexs => index;
  getRound(int? id) async {
    isLoading = true;
    round = await roundsSer.roundsData(id);
    isLoading = false;
    notifyListeners();
  }

  getIndex(int ind) {
    index = ind;
    notifyListeners();
  }
}
