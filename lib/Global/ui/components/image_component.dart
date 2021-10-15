import 'package:flutter/material.dart';
//import 'package:lottie/lottie.dart';

Icon customIcon(IconData icon, double size, Color color) {
  return Icon(
    icon,
    size: size,
    color: color,
  );
}

Widget customImage(String assetName, [double width = 200.0, double height = 200.0]) {
  return Image.asset('assets/images/$assetName', width: width, height: height);
}

/*Widget buildLottie(String lottieName, [double width = 200, double height = 200]) {
  return Container(
    child: Lottie.asset(
      'assets/images/$lottieName',
      fit: BoxFit.fill,
      width: width,
      height: height,
    ),
  );
}*/