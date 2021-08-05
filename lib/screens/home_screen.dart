import 'package:flutter/material.dart';
import 'package:peliculas/providers/movieProvider.dart';
import 'package:peliculas/searchDelegate/movie_search_delegate.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final movies = Provider.of<MovieProvider>(context);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.movie_filter_outlined),
        title: Text('Peliculas'),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(context: context, delegate: MovieSearchDelegate());
            }, )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            CardSwiper(movies: movies.moviesList),

            MovieSlider(
              popularMovies: movies.popularMoviesList,
              onDisplayMovies: () => movies.getPopularMovies(),
              title: 'Populares'
            ),

          ],
        ),
      )
    );
  }
}
