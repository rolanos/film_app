class QuerryParameter {
  //Номер типа 1 (movie) | 2 (tv-series) | 3 (cartoon) | 4 (anime) | 5 (animated-series) | 6 (tv-show)
  final int typeNumber;

  //Промежуток лет year1-year2
  final String years;

  //Промежуток рейтинга rating1-rating2
  final int rating;

  //Поиск по имени персоны
  final String personName;

  QuerryParameter(
      {required this.typeNumber,
      required this.years,
      required this.rating,
      required this.personName});
}
