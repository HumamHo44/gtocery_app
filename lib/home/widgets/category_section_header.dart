import 'package:flutter/material.dart';
import 'package:gtocery_app/theme_manager.dart';
import 'package:provider/provider.dart';

class CategorySectionHeader extends StatelessWidget {
  const CategorySectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Categories',
                style: TextStyle(
                  color: themeManager.themeMode == ThemeMode.dark
                      ? Colors.white
                      : Color(0xFF05161B),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
