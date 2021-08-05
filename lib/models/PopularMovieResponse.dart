import 'dart:convert';

import 'Movie.dart';

class PopularMovieResponse {
  PopularMovieResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory PopularMovieResponse.fromJson(String str) => PopularMovieResponse.fromMap(json.decode(str));

  factory PopularMovieResponse.fromMap(Map<String, dynamic> json) => PopularMovieResponse(
    page: json["page"],
    results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

}