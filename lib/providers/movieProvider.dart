import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MovieProvider extends ChangeNotifier {

  String
      _apiKey   = '4af06147b81b080f77af08b1ec31d279',
      _baseUrl  = 'api.themoviedb.org',
      _language = 'es-ES';

  MovieProvider(){
    print('Inicializacion del MovieProvider');

    this.getMovies();
  }

  getMovies() async {

    var url = Uri.https(_baseUrl, '/3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1'
    });

    var response = await http.get(url);

    final Map<String, dynamic> decodeData = json.decode(response.body);

    print(decodeData);

  }

}