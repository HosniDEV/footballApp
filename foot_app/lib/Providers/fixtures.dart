import 'package:flutter/material.dart';
import '../Models/fixtures.dart';
import '../Services/fixtures.services.dart';

class FixturesProvider extends ChangeNotifier {
  List<FixturesG> fixtures = [];
  List<FixturesG> get fixturesP => fixtures;
  FixturesSer fixturesSer = FixturesSer();
  bool isLoading = false;
  String? round = "";
  String? get roundf => round;

  getRound(String? roundx) {
    round = roundx;
    notifyListeners();
  }

  getFixtures(int? id, String? rou) async {
    isLoading = true;
    fixtures = await fixturesSer.getFixtures(id, rou);
    isLoading = false;
    notifyListeners();
  }
}
