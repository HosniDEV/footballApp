import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foot_app/Styles/app_color.dart';
import 'package:http/retry.dart';
import 'package:provider/provider.dart';

import '../../Providers/teams.dart';
import '../../Services/rounds_services.dart';

class TeamsLeague extends StatefulWidget {
  const TeamsLeague({super.key, required this.id});
  final int? id;

  @override
  State<TeamsLeague> createState() => _TeamsLeagueState();
}

class _TeamsLeagueState extends State<TeamsLeague> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<TeamProvider>(context, listen: false);
    provider.getTeam(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TeamProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        // height: 100,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: ListView.separated(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: provider.teamP.length,
          separatorBuilder: (context, index) => const Divider(
            color: backgroundColor,
            height: 2,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.network(
                    '${provider.teamP[index].team!.logo}',
                    height: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // SvgPicture.network('${provider.teamP[index].team!.country}'),
                  Text(
                    '${provider.teamP[index].team!.name}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
