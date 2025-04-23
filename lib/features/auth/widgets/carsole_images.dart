import 'package:amazonapp/conastant/global_var.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarsoleImages extends StatelessWidget {
  const CarsoleImages({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: Globalvar.carsoleimages.map((e) {
          return Builder(
              builder: (BuildContext context) => Image.network(
                    e,
                    fit: BoxFit.cover,
                    height: 150,
                  ));
        }).toList(),
        options: CarouselOptions());
  }
}
