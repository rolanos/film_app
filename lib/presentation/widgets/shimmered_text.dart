import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmeredText extends StatelessWidget {
  final String title;
  final String? text;

  const ShimmeredText({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).textTheme.bodyMedium!.color!,
      highlightColor: const Color.fromARGB(255, 45, 68, 107),
      child: Visibility(
        visible: (text != null),
        child: Text(
          "$title: ${text ?? '-'}",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
