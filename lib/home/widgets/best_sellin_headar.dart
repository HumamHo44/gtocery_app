import 'package:flutter/material.dart';
import 'package:gtocery_app/home/vegetables_page.dart';
import 'package:gtocery_app/theme_manager.dart';
import 'package:provider/provider.dart';

class BestSellinHeadar extends StatelessWidget {
  const BestSellinHeadar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            'Best selling',
            style: TextStyle(
              color: themeManager.themeMode == ThemeMode.dark
                  ? Colors.white
                  : Color(0xFF05161B),
              fontSize: 18,

              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const VegetablesPage();
                  },
                ),
              );
            },
            child: const Text(
              'See all',
              style: TextStyle(
                color: Color(0xFF23AA49),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
