import 'package:flutter/material.dart';
import 'package:peliculas/models/Movie.dart';
import 'package:peliculas/providers/movieProvider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel => 'Buscar';

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(icon: Icon(Icons.close), onPressed: () => query = ''),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    if (query.isEmpty) return _movieIcon();

    final movieProvider = Provider.of<MovieProvider>(context, listen: false);

    return FutureBuilder(
        future: movieProvider.searchMovie(query),
        builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
          if (!snapshot.hasData) return _movieIcon();

          final movie = snapshot.data!;

          return ListView.builder(
              itemCount: movie.length,
              itemBuilder: (_, int index) => _MovieItem(movie: movie[index]));
        });
  }

  Widget _movieIcon() {
    return Container(
      child: Center(
        child: Icon(
          Icons.movie_creation_outlined,
          size: 150,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class _MovieItem extends StatelessWidget {

  final Movie movie;

  const _MovieItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListTile(
        leading: FadeInImage(
          placeholder: AssetImage('assets/images/placeholder.png'),
          image: NetworkImage(movie.fullPosterPath),
          width: 40,
        ),
        title: Text(movie.title),
        subtitle: Text(movie.originalTitle),
        onTap: (){
          Navigator.of(context).pushNamed('/details', arguments: movie);
        },
      ),
    );
  }
}
