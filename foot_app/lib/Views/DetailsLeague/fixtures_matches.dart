// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Common/reusable_card.dart';
import '../../Providers/fixtures.dart';
import '../../Services/fixtures.services.dart';

class FixturesMatches extends StatefulWidget {
  const FixturesMatches({
    Key? key,
    this.id,
    this.round,
  }) : super(key: key);
  final int? id;
  final String? round;

  @override
  State<FixturesMatches> createState() => _FixturesMatchesState();
}

class _FixturesMatchesState extends State<FixturesMatches> {
  @override
  void initState() {
    final provider = Provider.of<FixturesProvider>(context, listen: false);
    provider.getFixtures(
      widget.id,
      widget.round,
    );
    super.initState();
  }

  FixturesSer fixtures = FixturesSer();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FixturesProvider>(context, listen: false);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: provider.fixturesP.length,
      itemBuilder: (context, index) {
        return ReusableCard(
          homeImage: '${provider.fixturesP[index].team!.home!.logo}',
          awayImage: '${provider.fixturesP[index].team!.away!.logo}',
          homeName: '${provider.fixturesP[index].team!.home!.name}',
          awayName: '${provider.fixturesP[index].team!.away?.name!}',
        );
      },
    );
  }
}
