import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gtocery_app/models/slide_model.dart';
import 'package:gtocery_app/services/slide_service.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SlideModel>>(
      future: SlideService.getAllSlides(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 200,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return const SizedBox(
            height: 200,
            child: Center(child: Text("error")),
          );
        }

        final slides = snapshot.data ?? [];

        return CarouselSlider(
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: true,
          ),
          items: slides.map((slide) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(slide.imageUrl, fit: BoxFit.cover),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
