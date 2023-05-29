import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foot_app/Styles/app_color.dart';
import 'package:http/retry.dart';
import 'package:provider/provider.dart';

import '../../Providers/standing.dart';
import '../../Providers/teams.dart';

class StandingLeague extends StatefulWidget {
  const StandingLeague({super.key, required this.id});
  final int? id;

  @override
  State<StandingLeague> createState() => _StandingLeagueState();
}

class _StandingLeagueState extends State<StandingLeague> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<StandingProvider>(context, listen: false);
    provider.getStanding(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StandingProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          // height: 100,
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: provider.standingP.length,
            itemBuilder: (context, ind) {
              return ListView.separated(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: provider.standingP[0].league!.standing![ind].length,
                separatorBuilder: (context, index) => const Divider(
                  color: backgroundColor,
                  height: 2,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          '${index + 1} - '.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        Image.network(
                          '${provider.standingP[0].league!.standing![ind][index].team!.logo}',
                          height: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        // SvgPicture.network('${provider.teamP[index].team!.country}'),
                        Text(
                          '${provider.standingP[0].league!.standing![ind][index].team!.name}',
                          style: TextStyle(color: Colors.white),
                        ),
                        Spacer(),
                        Text(
                          '${provider.standingP[0].league!.standing![ind][index].points}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          )),
    );
  }
}
