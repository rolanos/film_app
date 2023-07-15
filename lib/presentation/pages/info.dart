import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app/presentation/widgets/shimmered_text.dart';
import 'package:shimmer/shimmer.dart';

import '../bloc/bloc/movie_bloc.dart';
import '../widgets/person_grid.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            ),
            child: Container(
              width: double.maxFinite,
              clipBehavior: Clip.hardEdge,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              child: (state is MovieLoadedState)
                  ? Column(
                      children: [
                        //Заглавие
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Короткое описание",
                            style: textTheme.titleMedium,
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        //Короткое описание
                        Text(
                          state.movie.shortDescription ??
                              "Короткое описание отсутсвует",
                          style: textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        ShimmeredText(
                          title: "Слоган",
                          text: state.movie.slogan,
                        ),
                        const SizedBox(
                          height: 6,
                        ),

                        ShimmeredText(
                          title: "Рейтинг",
                          text: state.movie.ratingKp.toString(),
                        ),

                        const SizedBox(
                          height: 6,
                        ),

                        ShimmeredText(
                          title: "Альтернативное название",
                          text: state.movie.alternativeName,
                        ),

                        const Divider(
                          thickness: 1,
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Персоны",
                            style: textTheme.titleMedium,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        PersonGrid(
                          persons: state.movie.persons,
                        ),
                      ],
                    )
                  : const Align(
                      alignment: Alignment.center,
                      child: ShimmeredText(
                        title: "Загрузка",
                        text: "Получаем информацию о фильме",
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
