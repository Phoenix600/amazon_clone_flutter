import 'package:amazonclone/constants/global_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        for (final image in GlobalVariables.carouselImages)
          Builder(builder: (BuildContext context) {
            return Image.network(
              image,
              fit: BoxFit.cover,
              height: 200,
            );
          })
      ],
      options: CarouselOptions(
          viewportFraction: 1,
          height: 200,
          enableInfiniteScroll: true,
          autoPlay: true),
    );
  }
}
