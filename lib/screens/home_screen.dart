import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas'),
        elevation: 0,
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            CardSwiper(),

            MovieSlider(),

          ],
        ),
      )
    );
  }
}
