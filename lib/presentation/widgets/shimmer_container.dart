import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmeredContainer extends StatelessWidget {
  final double height;
  final double width;

  const ShimmeredContainer(
      {super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    final double borderRadius;
    if (height < 42 || width < 42) {
      borderRadius = 6;
    } else {
      borderRadius = 12;
    }
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 62, 62, 63),
      highlightColor: const Color.fromARGB(255, 65, 66, 72),
      period: const Duration(milliseconds: 900),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
      ),
    );
  }
}
