import 'package:flutter/material.dart';
import 'package:foot_app/Styles/app_color.dart';

class GradientPicture extends StatelessWidget {
  GradientPicture({
    super.key,
    required this.height,
    this.image,
    this.fit,
  });
  String? image;
  final double height;
  BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: backgroundColor,
          image: DecorationImage(fit: fit, image: NetworkImage('$image'))),
      child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black],
                  stops: [0, 0.9]))),
    );
  }
}
