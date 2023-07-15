import 'package:quote_app/data/models/api_movie.dart';
import 'package:quote_app/domain/entities/movie.dart';

class MovieMapper {
  static MovieEntity fromApi(ApiMovie movie) {
    PersonList persons = PersonList();
    persons.fromJson(movie.persons);
    return MovieEntity(
        id: movie.id,
        year: movie.year,
        movieLength: movie.movieLength,
        name: movie.name,
        alternativeName: movie.alternativeName,
        shortDescription: movie.shortDescription,
        slogan: movie.slogan,
        poster: movie.poster,
        ratingKp: movie.ratingKp,
        persons: persons);
  }
}
