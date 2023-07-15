import 'package:quote_app/domain/entities/movie.dart';

import '../repositoties/movie_repository.dart';

class GetRandomMovie {
  final MovieRepository repository;

  GetRandomMovie(this.repository);

  Future<MovieEntity> call() async {
    return await repository.getRandomMovie();
  }
}
