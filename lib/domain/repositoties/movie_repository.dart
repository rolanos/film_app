import 'package:quote_app/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<MovieEntity> getRandomMovie();
}
