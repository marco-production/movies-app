import 'dart:convert';

import 'package:peliculas/models/Cast.dart';

class CastResponse {
  CastResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  int id;
  List<Cast> cast;
  List<Cast> crew;

  factory CastResponse.fromJson(String str) => CastResponse.fromMap(json.decode(str));

  factory CastResponse.fromMap(Map<String, dynamic> json) => CastResponse(
    id: json["id"],
    cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
    crew: List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
  );
}