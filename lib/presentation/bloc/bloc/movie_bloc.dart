import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_app/data/repository/dio_api.dart';
import 'package:quote_app/data/repository/movie_repositoty_impl.dart';
import 'package:quote_app/domain/entities/movie.dart';
import 'package:quote_app/domain/repositoties/movie_repository.dart';
import 'package:quote_app/domain/usecases/get_random_movie.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieRepository repository =
      MovieRepositoryImpl(DioApi("https://api.kinopoisk.dev"));

  MovieBloc() : super(MovieEmptyState()) {
    on<MovieGetRandomEvent>((event, emit) async {
      emit(MovieLoadingState());
      try {
        final movie = await GetRandomMovie(repository).call();
        emit(MovieLoadedState(movie));
      } catch (e) {
        emit(MovieErrorState());
      }
    });
  }
}
