import 'package:flutter/material.dart';

import '../Models/leagues.dart';
import '../Models/standings.dart';
import '../Services/leagues_service.dart';
import '../Services/standing_services.dart';

class StandingProvider extends ChangeNotifier {
  List<Global> standing = [];
  List<Global> get standingP => standing;
  StandingSer standingSer = StandingSer();
  bool isLoading = false;

  getStanding(int? id) async {
    isLoading = true;

    standing = await standingSer.getStanding(id);

    isLoading = false;
    notifyListeners();
  }
}
