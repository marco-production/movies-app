import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/Cast.dart';
import 'package:peliculas/providers/movieProvider.dart';
import 'package:provider/provider.dart';

class ActorSlider extends StatelessWidget {

  final int castId;

  const ActorSlider({
    Key? key,
    required this.castId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final thisProvider = Provider.of<MovieProvider>(context, listen: false);

    return FutureBuilder(
        future: thisProvider.getCasts(castId),
        builder: (_, AsyncSnapshot<List<Cast>> snapshot){

      if (!snapshot.hasData) {
        return Container(
          width: double.infinity,
          height: 100,
          child: CupertinoActivityIndicator(),
        );
      }

      final cast = snapshot.data!;

      return Container(
        width: double.infinity,
        height: 255,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cast.length,
            itemBuilder: (BuildContext context, int index){
              return _CardCast(cast: cast[index]);
            }
        ),
      );

    });
  }
}

class _CardCast extends StatelessWidget {

  final Cast cast;

  const _CardCast({
    Key? key,
    required this.cast
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 22.0),
      width: 110,
      height: 165,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/images/placeholder.png'),
              image: NetworkImage(cast.fullProfilePath),
              width: 110,
              height: 165,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only( top: 3.0),
            child: Text(cast.name, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, maxLines: 2,),
          )
        ],
      ),
    );;
  }
}
