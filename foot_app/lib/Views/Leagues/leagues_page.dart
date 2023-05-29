import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foot_app/Providers/league.dart';
import 'package:foot_app/Styles/app_color.dart';
import 'package:foot_app/Views/DetailsLeague/details_league.dart';
import 'package:provider/provider.dart';

import '../../Common/gradient_picture.dart';
import '../../Common/reusable_card.dart';
import '../../Models/rounds.dart';
import '../../Services/fixtures.services.dart';
import '../../Services/rounds_services.dart';

class LeaguesPage extends StatefulWidget {
  const LeaguesPage({super.key});

  @override
  State<LeaguesPage> createState() => _LeaguesPageState();
}

class _LeaguesPageState extends State<LeaguesPage> {
  RoundsSer round = RoundsSer();
  FixturesSer fixturesSer = FixturesSer();
  @override
  void initState() {
    super.initState;
    final provider = Provider.of<LeagueProvider>(context, listen: false);

    provider.getLeague();
  }

  FixturesSer fixtures = FixturesSer();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LeagueProvider>(context);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              GradientPicture(
                  fit: BoxFit.cover,
                  height: height * 0.35,
                  image:
                      'https://i.pinimg.com/564x/27/a9/6a/27a96a3dcb96a147719997a44368639d.jpg'),
              const Positioned(
                  // top: 0,
                  // bottom: 0,
                  // right: 0,
                  // left: 0,
                  child: Text(
                'Home Of Football',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              )),
              Positioned(
                  bottom: 20,
                  right: 0,
                  left: 0,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: !provider.isLoading
                          ? LeaguesCard(provider: provider)
                          : const Center(child: CircularProgressIndicator()))),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            // child: ReusableCard(),
          )
        ],
      ),
    );
  }
}

class LeaguesCard extends StatelessWidget {
  const LeaguesCard({
    super.key,
    required this.provider,
  });

  final LeagueProvider provider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: provider.leagueP.length,
        itemBuilder: (context, index) {
          var data = provider.leagueP[index];
          if (provider.leagueP[index].league!.id == 39 ||
              provider.leagueP[index].league!.id == 78 ||
              provider.leagueP[index].league!.id == 88 ||
              provider.leagueP[index].league!.id == 135 ||
              provider.leagueP[index].league!.id == 140 ||
              provider.leagueP[index].league!.id == 6) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsLeague(
                          id: data.league!.id,
                          image: data.league!.logo,
                          league: data.league!.name),
                    ));
              },
              child: Container(
                margin: const EdgeInsets.only(right: 5),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 30,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  '${data.league!.name}',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            );
          } else {
            return Container(
              height: 0,
              width: 0,
            );
          }
        },
      ),
    );
  }
}
