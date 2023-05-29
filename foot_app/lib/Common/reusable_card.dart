// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Styles/app_color.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    Key? key,
    required this.homeImage,
    this.awayImage,
    this.homeName,
    this.awayName,
  }) : super(key: key);
  final String? homeImage;
  final String? awayImage;
  final String? homeName;
  final String? awayName;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      // height: 110,
      decoration: BoxDecoration(
        border: Border.all(width: 0.1, color: Colors.white),
        color: cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  '$homeImage',
                  height: 30,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  '$homeName',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'APRIL 27',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  '17:30',
                  style: TextStyle(color: primaryColor),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  '$awayImage',
                  height: 30,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  '$awayName',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ]),
    );
  }
}
