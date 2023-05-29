import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/fixtures.dart';
import 'Providers/league.dart';
import 'Providers/rounds.dart';
import 'Providers/standing.dart';
import 'Providers/teams.dart';
import 'Styles/app_color.dart';
import 'Views/DetailsLeague/details_league.dart';
import 'Views/Leagues/leagues_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LeagueProvider()),
        ChangeNotifierProvider(create: (context) => TeamProvider()),
        ChangeNotifierProvider(create: (context) => StandingProvider()),
        ChangeNotifierProvider(create: (context) => RoundsProvider()),
        ChangeNotifierProvider(create: (context) => FixturesProvider()),
      ],
      child: MaterialApp(
        // title: 'Flutter Demo',
        theme: ThemeData(scaffoldBackgroundColor: backgroundColor),
        debugShowCheckedModeBanner: false,
        home: LeaguesPage(),
      ),
    );
  }
}
