import 'package:equatable/equatable.dart';

class MovieEntity {
  final int? id;
  //Год выпуска
  final int? year;
  //Длительность в минутах
  final int? movieLength;
  //Название
  final String? name;
  //Альтернативное название
  final String? alternativeName;
  //Короткое описание
  final String? shortDescription;
  //Слоган фильма
  final String? slogan;
  //Постер
  final String? poster;
  //Рейтинг на Кинопоиск
  final double? ratingKp;
  //Персоны
  final PersonList? persons;

  MovieEntity(
      {this.id,
      this.year,
      this.movieLength,
      this.name,
      this.alternativeName,
      this.shortDescription,
      this.slogan,
      this.poster,
      this.ratingKp,
      this.persons});
}

class PersonList {
  List<Person>? actors;
  List<Person>? operators;
  List<Person>? directors;
  List<Person>? producers;

  PersonList({this.actors, this.operators, this.directors, this.producers});

  List<Person> toList() {
    List<Person> pesrons = [
      ...?actors,
      ...?operators,
      ...?directors,
      ...?producers,
    ];
    return pesrons;
  }

  void fromJson(List<dynamic>? list) {
    actors = [];
    operators = [];
    directors = [];
    producers = [];
    if (list == null) {
      return;
    }
    for (var persons in list) {
      Person person = Person(
          id: persons['id'], photoUrl: persons['photo'], name: persons['name']);
      if (persons['enProfession'] == "actor") {
        actors!.add(person);
      }
      if (persons['enProfession'] == "director") {
        directors!.add(person);
      }
      if (persons['enProfession'] == "operator") {
        operators!.add(person);
      }
      if (persons['enProfession'] == "producer") {
        producers!.add(person);
      }
    }
  }
}

class Person extends Equatable {
  final int id;
  final String? photoUrl;
  final String? name;

  const Person({required this.id, required this.photoUrl, required this.name});
  @override
  List<Object?> get props => [id, photoUrl, name];
}
