import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';


class CardSwiper extends StatelessWidget {
  //CardSwiper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final mediaQuerySize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: mediaQuerySize.height * 0.53,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: mediaQuerySize.width * 0.57,
        itemHeight: mediaQuerySize.height * 0.48,
        itemBuilder: (_, int index){
          return GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed('/details');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: FadeInImage(
                  placeholder: AssetImage('assets/images/placeholder.png'),
                  image: NetworkImage('https://via.placeholder.com/300x400'),
                  fit: BoxFit.cover,
              ),
            ),
          );
        },

      ),
    );
  }
}
