import 'package:flutter/material.dart';
import 'package:gtocery_app/home/vegetables_page.dart';
import 'package:gtocery_app/home/widgets/category_card.dart';
import 'package:gtocery_app/models/category_model.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> categories = [
      CategoryModel(
        iconPath: 'assets/images/apple.svg',
        title: 'Fruits',
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const VegetablesPage();
              },
            ),
          );
        },
      ),
      CategoryModel(
        iconPath: 'assets/images/broccoli.svg',
        title: 'Vegetables',
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const VegetablesPage();
              },
            ),
          );
        },
      ),
      CategoryModel(
        iconPath: 'assets/images/cheese.svg',
        title: 'Diary',
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const VegetablesPage();
              },
            ),
          );
        },
      ),
      CategoryModel(
        iconPath: 'assets/images/meat.svg',
        title: 'Meat',
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const VegetablesPage();
              },
            ),
          );
        },
      ),
    ];

    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CategoryCard(
              iconPath: category.iconPath,
              title: category.title,
              onTap: category.onTap,
            ),
          );
        },
      ),
    );
  }
}
