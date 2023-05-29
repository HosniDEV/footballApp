// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import 'package:foot_app/Styles/app_color.dart';

import '../../Providers/fixtures.dart';
import '../../Providers/rounds.dart';
import 'fixtures_matches.dart';

class FixturesLeague extends StatefulWidget {
  const FixturesLeague({super.key, required this.id});
  final int? id;

  @override
  State<FixturesLeague> createState() => _FixturesLeagueState();
}

class _FixturesLeagueState extends State<FixturesLeague> {
  @override
  void initState() {
    final providerR = Provider.of<RoundsProvider>(context, listen: false);
    providerR.getRound(widget.id);
    super.initState();
  }

  String? round = 'Regular Season - 1';
  String? rn = '';
  @override
  Widget build(BuildContext context) {
    final providerR = Provider.of<RoundsProvider>(context, listen: false);
    final provider = Provider.of<FixturesProvider>(context, listen: false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: providerR.rounds.response!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      providerR.getIndex(index + 1);
                      var ahmed = providerR.rounds.response![index];
                      // print(ahmed);
                      if (ahmed != null) {
                        provider.getRound('$ahmed');
                      }
                      var rn = provider.round;
                      print(rn);
                      int? num = providerR.indexs;
                    },
                    child: RoundsCard(
                      round: index + 1,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            !provider.isLoading
                ? Expanded(
                    child: Container(
                    color: Colors.red,
                    alignment: Alignment.topCenter,
                    child: FixturesMatches(
                      id: widget.id,
                      round: provider.roundf == ''
                          ? 'Regular Season - 2'
                          : provider.roundf,
                    ),
                  ))
                : CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class RoundsCard extends StatefulWidget {
  const RoundsCard({
    Key? key,
    this.round,
    this.function,
  }) : super(key: key);
  final int? round;
  final VoidCallback? function;
  @override
  State<RoundsCard> createState() => _RoundsCardState();
}

class _RoundsCardState extends State<RoundsCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.function,
      child: Container(
        margin: const EdgeInsets.only(right: 5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 0.9, color: primaryColor)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Round',
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              '${widget.round.toString()}',
              style: const TextStyle(
                  color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}
