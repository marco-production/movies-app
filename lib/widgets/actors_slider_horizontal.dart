import 'package:flutter/material.dart';

class ActorSlider extends StatelessWidget {
  //ActorSlider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: 216,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index){
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              width: 110,
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: FadeInImage(
                      placeholder: AssetImage('assets/images/placeholder.png'),
                      image: NetworkImage('https://via.placeholder.com/300x400'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only( top: 3.0),
                    child: Text('Robert Downey Junior', textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, maxLines: 2,),
                  )
                ],
              ),
            );
          }
      ),
    );
  }
}
