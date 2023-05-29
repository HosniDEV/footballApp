import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:foot_app/Views/DetailsLeague/fixture_league.dart';
import 'package:foot_app/Views/DetailsLeague/standings.dart';
import 'package:foot_app/Views/DetailsLeague/stats_league.dart';
import 'package:foot_app/Views/DetailsLeague/teams_league.dart';

import '../../Common/gradient_picture.dart';
import '../../Styles/app_color.dart';

class DetailsLeague extends StatefulWidget {
  const DetailsLeague({
    super.key,
    required this.id,
    required this.image,
    this.league,
  });
  final int? id;
  final String? image;
  final String? league;

  @override
  State<DetailsLeague> createState() =>
      _DetailsLeagueState(id: id, image: image, league: league);
}

class _DetailsLeagueState extends State<DetailsLeague> {
  _DetailsLeagueState({this.id, this.image, this.league});
  final String? image;
  final String? league;

  final int? id;
  List<Widget> screens = [];
  int currentIndex = 0;
  List<String> list = [
    'Schedule',
    'Standing',
    'Stats',
    'Teams',
  ];
  @override
  void initState() {
    super.initState();
    screens = [
      FixturesLeague(id: widget.id),
      StandingLeague(id: widget.id),
      StatsLeague(id: widget.id),
      TeamsLeague(id: widget.id),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Column(children: [
            Stack(
              children: [
                GradientPicture(
                  height: size.height * 0.35,
                  fit: BoxFit.cover,
                  image:
                      'https://i.pinimg.com/564x/27/a9/6a/27a96a3dcb96a147719997a44368639d.jpg',
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height: 30,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 5),
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: currentIndex != index
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                  color: currentIndex == index
                                      ? primaryColor
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                '${list[index].toUpperCase()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: currentIndex == index
                                      ? backgroundColor
                                      : primaryColor,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 50,
                    left: 0,
                    right: 0,
                    child: Text(
                      '${league}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),
                    ))
              ],
            ),
            Expanded(
              child: screens[currentIndex],
            ),
          ]),
        ),
      ),
    );
  }
}
