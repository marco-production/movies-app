import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final String arg = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppbar(),
          SliverList(delegate: SliverChildListDelegate([
            _MovieContent(),
            _DescriptionOfMovie(),
            _DescriptionOfMovie(),
            ActorSlider(),
          ])),
        ],
      ),
    );
  }
}


class _CustomAppbar extends StatelessWidget {
  //_CustomAppbar({Key key}) : super(key: key);

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
            //color: Colors.red,
            color: Colors.black26,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 7.0),
              child: Text('movie.title', style: TextStyle(fontSize: 16)),
            ),
          ),

          background: FadeInImage(
            placeholder: AssetImage('assets/images/loading.gif'),
            image: NetworkImage('https://via.placeholder.com/300x400'),
            fit: BoxFit.cover,
          ),
        ),
    );
  }
}

class _MovieContent extends StatelessWidget {
 // _MovieContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top:15),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/images/loading.gif'),
              image: NetworkImage('https://via.placeholder.com/300x400'),
              width: 130,
              height: 170,
            ),
          ),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('movie.title ', style: TextStyle(fontSize: 23),),
              Text('movie.originalTitle', style: TextStyle(fontSize: 14),),
              Row(
                children: <Widget>[
                  Icon(Icons.star_outline, size: 15, color: Colors.grey),
                  SizedBox(width: 2,),
                  Text('movie.voteAverage', style: Theme.of(context).textTheme.caption)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _DescriptionOfMovie extends StatelessWidget {
  //_DescriptionOfMovie({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        textAlign: TextAlign.justify,
      ),
    );
  }
}

