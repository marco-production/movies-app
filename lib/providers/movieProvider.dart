import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/Cast.dart';
import 'package:peliculas/models/CastResponse.dart';
import 'package:peliculas/models/Movie.dart';
import 'package:peliculas/models/MovieResponse.dart';
import 'package:peliculas/models/PopularMovieResponse.dart';
import 'package:peliculas/models/SearchMovie.dart';

class MovieProvider extends ChangeNotifier {

  String
      _apiKey   = '4af06147b81b080f77af08b1ec31d279',
      _baseUrl  = 'api.themoviedb.org',
      _language = 'es-ES';

  List<Movie>
      moviesList = [],
      popularMoviesList = [],
      searchMoviesList = [];

  Map<int, List<Cast>> castList = {};

  int
  _pageOfPopularMovie = 0
  //_pageOfSearchMovie = 0
  ;

  MovieProvider(){
    this.getMovies();
    this.getPopularMovies();
  }

  Future<String> _getMovieHTTP(String path, [int page = 1, String query = '']) async{

    var url = Uri.https(_baseUrl, path, {
      'api_key': _apiKey,
      'language': _language,
      'page': page.toString(),
      'query': query
    });

    var response = await http.get(url);

    return response.body;
  }

  getMovies() async {

    var response = await _getMovieHTTP('/3/movie/now_playing');
    final movies = MovieResponse.fromJson(response);

    moviesList = movies.results;
    notifyListeners();
  }

  getPopularMovies() async {

    _pageOfPopularMovie++;

    var response = await _getMovieHTTP('/3/movie/popular', _pageOfPopularMovie);
    final movies = PopularMovieResponse.fromJson(response);

    popularMoviesList = [...popularMoviesList, ...movies.results];
    notifyListeners();
  }

  Future<List<Cast>> getCasts(int movieId) async {
    
    if(castList.containsKey(movieId)) return castList[movieId]!;

    var response = await _getMovieHTTP('/3/movie/$movieId/credits');
    final castResponse = CastResponse.fromJson(response);

    castList[movieId] = castResponse.cast;

    return castResponse.cast;
  }

  Future<List<Movie>> searchMovie(String query) async {

    //_pageOfSearchMovie++;

    var response = await _getMovieHTTP('/3/search/movie', 1, query);
    final movies = SearchMovie.fromJson(response);

    searchMoviesList = movies.results;

    return searchMoviesList;
  }

}