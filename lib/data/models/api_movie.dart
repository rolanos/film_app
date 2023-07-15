class ApiMovie {
  final int? id;
  final int? year;
  final int? movieLength;
  final String? name;
  final String? alternativeName;
  final String? shortDescription;
  final String? slogan;
  final String? poster;
  final double? ratingKp;
  final List<dynamic>? persons;
  ApiMovie.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        year = map['year'],
        movieLength = map['movieLength'],
        name = map['name'],
        alternativeName = map['alternativeName'],
        shortDescription = map['shortDescription'],
        slogan = map['slogan'],
        poster = map['poster']['url'],
        ratingKp = map['rating']['kp'],
        persons = map['persons'];
}
