import 'package:flutter/material.dart';

//ignore: must_be_immutable
class Barrier extends StatelessWidget {
  double size;

  Barrier({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.green.shade300,
      ),
      height: size,
      width: 100,
    );
  }
}
