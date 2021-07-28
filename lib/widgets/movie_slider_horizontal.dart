import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  //MovieSlider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      height: 240,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text('Populares', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
          ),

          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 10, bottom: 2),
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) => _MovieContainer(),
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed('/details', arguments: 'el-rescate-de-alcatras');
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: 125,
          height: 75,
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: <Widget>[

              FadeInImage(
                placeholder: AssetImage('assets/images/placeholder.png'),
                image: NetworkImage('https://via.placeholder.com/300x400'),
                width: 125,
                height: 170,
                fit: BoxFit.cover,
              ),

              SizedBox(height: 3),

              Text('El rescate el día de la redención Purga por Siempre', maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,),

            ],
          ),
        ),
      ),
    );
  }
}
