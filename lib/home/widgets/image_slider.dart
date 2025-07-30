import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'assets/images/slider1.png',
      'assets/images/slider2.png',
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        enlargeCenterPage: true,
      ),
      items: images.map((imagePath) {
        return Container(
          width: double.infinity,

          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
        );
      }).toList(),
    );
  }
}
