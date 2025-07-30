import 'package:flutter/material.dart';
import 'package:gtocery_app/home/widgets/category_card.dart';
import 'package:gtocery_app/models/category_model.dart';
import 'package:gtocery_app/home/vegetables_page.dart';
import 'package:gtocery_app/services/category_service.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel>>(
      future: CategoryService.getAllCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text("error uploading"));
        }

        final categories = snapshot.data ?? [];

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
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const VegetablesPage()),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
