import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gtocery_app/home/widgets/best_sellin_headar.dart';
import 'package:gtocery_app/home/widgets/best_selling_grid.dart';
import 'package:gtocery_app/home/widgets/categories_section.dart';
import 'package:gtocery_app/home/widgets/category_section_header.dart';
import 'package:gtocery_app/home/widgets/custom_home_app_bar.dart';
import 'package:gtocery_app/home/widgets/image_slider.dart';
import 'package:gtocery_app/home/widgets/search_text_filed.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          CustomHomeAppBar(),
          SizedBox(height: 24),
          SearchTextFiled(),
          SizedBox(height: 12),
          ImageSlider(),
          SizedBox(height: 12),
          CategorySectionHeader(),
          SizedBox(height: 12),
          CategoriesSection(),
          SizedBox(height: 12),
          BestSellinHeadar(),
          SizedBox(height: 16),
          BestSellingGrid(),
        ],
      ),
    );
  }
}

class InActiveItim extends StatelessWidget {
  const InActiveItim({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(image);
  }
}

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(image);
  }
}

class NaivgationBarItem extends StatelessWidget {
  const NaivgationBarItem({
    super.key,
    required this.isSelected,
    required this.inactiveImage,
    required this.activeImage,
  });
  final bool isSelected;
  final String inactiveImage;
  final String activeImage;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(image: activeImage)
        : InActiveItim(image: inactiveImage);
  }
}
