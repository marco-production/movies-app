import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:peliculas/models/Movie.dart';
import 'package:peliculas/screens/details_sreen.dart';

class CardSwiper extends StatelessWidget {

  final List<Movie> movies;

  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final mediaQuerySize = MediaQuery.of(context).size;

    if (movies.length == 0) {
      return Container(
        width: double.infinity,
        height: mediaQuerySize.height * 0.53,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Container(
      width: double.infinity,
      height: mediaQuerySize.height * 0.53,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: mediaQuerySize.width * 0.57,
        itemHeight: mediaQuerySize.height * 0.48,
        itemBuilder: (_, int index) {

          String heroId = 'cardSwiper-$index-${movies[index]}';

          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/details', arguments: ScreenArguments(heroId: heroId, movie: movies[index]));
            },
            child: Hero(
              tag: heroId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: FadeInImage(
                  placeholder: AssetImage('assets/images/placeholder.png'),
                  image: NetworkImage(movies[index].fullPosterPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
