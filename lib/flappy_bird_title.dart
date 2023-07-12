import 'package:flutter/material.dart';

class FlappyBirdTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/flappy bird title.png',
      // height: 60.h,
      width: MediaQuery.of(context).size.width,
    );
  }
}
