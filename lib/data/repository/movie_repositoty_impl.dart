import 'package:quote_app/data/mapper/movie_api_mapper.dart';
import 'package:quote_app/data/models/api_movie.dart';
import 'package:quote_app/domain/entities/movie.dart';
import 'package:quote_app/domain/repositoties/movie_repository.dart';

import 'dio_api.dart';

class MovieRepositoryImpl implements MovieRepository {
  final DioApi api;

  MovieRepositoryImpl(this.api);

  @override
  Future<MovieEntity> getRandomMovie() async {
    try {
      final response = await api.getRandomMovie();
      return MovieMapper.fromApi(ApiMovie.fromJson(response.data));
    } catch (_) {
      rethrow;
    }
  }
}
