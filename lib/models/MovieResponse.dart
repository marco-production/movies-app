import 'dart:convert';
import 'Movie.dart';

class MovieResponse {

  Dates dates;
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  MovieResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponse.fromJson(String str) => MovieResponse.fromMap(json.decode(str));

  factory MovieResponse.fromMap(Map<String, dynamic> json) => MovieResponse(
    dates: Dates.fromMap(json["dates"]),
    page: json["page"],
    results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

}

class Dates {

  DateTime maximum;
  DateTime minimum;

  Dates({
    required this.maximum,
    required this.minimum,
  });

  factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

  factory Dates.fromMap(Map<String, dynamic> json) => Dates(
    maximum: DateTime.parse(json["maximum"]),
    minimum: DateTime.parse(json["minimum"]),
  );

}
