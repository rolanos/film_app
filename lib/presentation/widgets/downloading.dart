import 'package:flutter/material.dart';
import 'package:quote_app/presentation/widgets/shimmer_container.dart';

Widget downloading(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          //Poster
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: ShimmeredContainer(
              height: size.height * 0.4,
              width: size.width,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //director
                ShimmeredContainer(
                  height: 24,
                  width: size.width * 0.2,
                ),
                Column(
                  children: [
                    //year
                    ShimmeredContainer(
                      height: 18,
                      width: size.width * 0.3,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    //Длительность
                    ShimmeredContainer(
                      height: 18,
                      width: size.width * 0.3,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      )
    ],
  );
}
