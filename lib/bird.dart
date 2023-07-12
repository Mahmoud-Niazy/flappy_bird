import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bird extends StatelessWidget {
  const Bird({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/bird.png',
      height: 60.h,
      width: 60.w,
    );
  }
}
