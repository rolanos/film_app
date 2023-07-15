part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieEmptyState extends MovieState {}

class MovieErrorState extends MovieState {}

class MovieLoadingState extends MovieState {}

class MovieLoadedState extends MovieState {
  final MovieEntity movie;

  const MovieLoadedState(this.movie);
}
