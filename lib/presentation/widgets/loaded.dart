import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app/presentation/bloc/bloc/movie_bloc.dart';
import 'package:quote_app/presentation/pages/settings.dart';
import 'package:quote_app/presentation/widgets/shimmer_container.dart';
import 'package:shimmer/shimmer.dart';

class Loaded extends StatelessWidget {
  const Loaded({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            (state is MovieLoadedState)
                ? Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 4, horizontal: size.width * 0.1),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            state.movie.name ?? "-",
                            style: textStyle.titleMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      //Poster
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 0,
                          vertical: 6,
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: size.width * 0.8,
                            maxHeight: size.height * 0.6,
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 6,
                                  spreadRadius: 6,
                                ),
                              ],
                            ),
                            child: CachedNetworkImage(
                              imageUrl: state.movie.poster ??
                                  "https://pressdubna.ru/images/img/no_img.jpg",
                              placeholder: (context, url) => ShimmeredContainer(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                width: size.width,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 4, horizontal: size.width * 0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            //director
                            Flexible(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    state.movie.persons!.directors!.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    child: Text(
                                      state.movie.persons!.directors![index]
                                              .name ??
                                          "-",
                                      style: textStyle.bodySmall!.copyWith(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  //year
                                  Text(
                                    state.movie.year.toString(),
                                    style: textStyle.bodyMedium!
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  //Длительность
                                  Text(
                                    "${(state.movie.movieLength == null) ? "-" : state.movie.movieLength.toString()} мин.",
                                    style: textStyle.bodyMedium!
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : const CircularProgressIndicator(),
            const Spacer(),
            Row(
              children: [
                const Spacer(),
                FloatingActionButton(
                  heroTag: "btn1",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: BlocProvider.of<MovieBloc>(context),
                          child: const SettingsPage(),
                        ),
                      ),
                    );
                  },
                  child: const Icon(Icons.settings),
                ),
                const Spacer(),
                FloatingActionButton(
                  heroTag: "btn2",
                  onPressed: () =>
                      context.read<MovieBloc>().add(MovieGetRandomEvent()),
                  child: const Icon(Icons.refresh),
                ),
                const Spacer(),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.arrow_upward),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Shimmer.fromColors(
                      baseColor: textStyle.bodyMedium!.color!,
                      highlightColor: Colors.grey.shade600,
                      child: Text(
                        "Подробная информация",
                        style: textStyle.bodyMedium!.copyWith(
                            color: const Color.fromARGB(255, 110, 117, 123),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const Icon(Icons.arrow_upward),
              ],
            ),
          ],
        );
      },
    );
  }
}
