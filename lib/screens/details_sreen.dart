import 'package:flutter/material.dart';
import 'package:peliculas/models/Movie.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;

    print(movie.id);

    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppbar(
            title: movie.title,
            backdropPath: movie.fullBackdropPath
          ),
          SliverList(delegate: SliverChildListDelegate([
            _MovieContent(
              id: movie.id,
              title: movie.title,
              posterPath: movie.fullPosterPath,
              originalTitle: movie.originalTitle,
              voteAverage: movie.voteAverage
            ),
            _DescriptionOfMovie(overview: movie.overview),
            ActorSlider(castId: movie.id),
          ])),
        ],
      ),
    );
  }
}


class _CustomAppbar extends StatelessWidget {

  final String title;
  final String backdropPath;

  const _CustomAppbar({
    Key? key,
    required this.title,
    required this.backdropPath
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverAppBar(
        expandedHeight: 200,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.all(0),
          centerTitle: true,
          title: Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(left: 20, right: 10),
            color: Colors.black26,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 7.0),
              child: Text(title, style: TextStyle(fontSize: 16), textAlign: TextAlign.center,),
            ),
          ),

          background: FadeInImage(
            placeholder: AssetImage('assets/images/loading.gif'),
            image: NetworkImage(backdropPath),
            fit: BoxFit.cover,
          ),
        ),
    );
  }
}

class _MovieContent extends StatelessWidget {

  final int id;
  final String title;
  final String posterPath;
  final String originalTitle;
  final double voteAverage;

  const _MovieContent({
    Key? key,
    required this.id,
    required this.title,
    required this.posterPath,
    required this.originalTitle,
    required this.voteAverage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top:15, bottom: 7),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: <Widget>[
          Hero(
            tag: id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/images/loading.gif'),
                image: NetworkImage(posterPath),
                width: 125,
                height: 185,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 15,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title, style: TextStyle(fontSize: 23), maxLines: 2, overflow: TextOverflow.ellipsis),
                Text(originalTitle, style: TextStyle(fontSize: 14)),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
                    Icon(Icons.star_outline, size: 15, color: Colors.grey),
                    SizedBox(width: 2),
                    Text(voteAverage.toString(), style: Theme.of(context).textTheme.caption)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _DescriptionOfMovie extends StatelessWidget {

  final String overview;

  const _DescriptionOfMovie({
    Key? key,
    required this.overview
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        overview,
        textAlign: TextAlign.justify,
      ),
    );
  }
}

