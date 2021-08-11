import 'package:flutter/material.dart';
import 'package:peliculas/models/Movie.dart';
import 'package:peliculas/screens/details_sreen.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> popularMovies;
  final String? title;
  final Function onDisplayMovies;

  const MovieSlider({
    Key? key,
    required this.popularMovies,
    required this.onDisplayMovies,
    this.title,
  }) : super(key: key);

  @override
  _MovieSliderState createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 500) {
        widget.onDisplayMovies();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          movieSliderTitle(),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.only(top: 10, bottom: 2),
              scrollDirection: Axis.horizontal,
              itemCount: widget.popularMovies.length,
              itemBuilder: (BuildContext context, int index) =>
                  _MovieContainer(widget.popularMovies[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget movieSliderTitle() {
    if (widget.title != null)
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          widget.title!,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
      );

    return Container();
  }
}

class _MovieContainer extends StatelessWidget {

  final Movie popularMovies;

  const _MovieContainer(this.popularMovies, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    String heroId = 'horizontalSlider-${popularMovies.id}';

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/details', arguments: ScreenArguments(heroId: heroId, movie: popularMovies));
      },
      child: Container(
        width: 125,
        height: 185,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: <Widget>[
            Hero(
              tag: heroId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: FadeInImage(
                  placeholder: AssetImage('assets/images/placeholder.png'),
                  image: NetworkImage(popularMovies.fullPosterPath),
                  width: 125,
                  height: 185,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 3),

            Text(popularMovies.title, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
