import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quote_app/presentation/widgets/shimmer_container.dart';

import '../../domain/entities/movie.dart';

class PersonGrid extends StatelessWidget {
  final PersonList? persons;

  const PersonGrid({super.key, this.persons});

  @override
  Widget build(BuildContext context) {
    final List<Person>? personList = persons?.toList();
    final TextTheme textStyle = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;

    if (personList == null) {
      return const CircularProgressIndicator();
    } else {
      for (int i = 0; i < personList.length; i++) {
        if (personList[i].name == null) {
          personList.removeAt(i);
          i--;
        }
      }
    }
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: size.height * 0.3,
      ),
      itemCount: personList.length,
      itemBuilder: (context, index) {
        late String job;

        if (persons!.actors!.contains(personList[index])) {
          job = "Актёр";
        }
        if (persons!.directors!.contains(personList[index])) {
          job = "Режиссёр";
        }
        if (persons!.operators!.contains(personList[index])) {
          job = "Оператор";
        }
        if (persons!.producers!.contains(personList[index])) {
          job = "Продюсер";
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 4,
              child: CachedNetworkImage(
                imageUrl: personList[index].photoUrl ??
                    "https://pressdubna.ru/images/img/no_img.jpg",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const ShimmeredContainer(
                  height: 128,
                  width: 128,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: 1,
                  child: Text(
                    personList[index].name ?? '-',
                    style: textStyle.bodyMedium!
                        .copyWith(fontWeight: FontWeight.w800),
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(job, style: textStyle.bodySmall),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
