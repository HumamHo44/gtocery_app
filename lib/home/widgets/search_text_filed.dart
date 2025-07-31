import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gtocery_app/theme_manager.dart';
import 'package:provider/provider.dart';

class SearchTextFiled extends StatelessWidget {
  const SearchTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 10),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Search category',
          hintStyle: TextStyle(
            color: themeManager.themeMode == ThemeMode.dark
                ? Color(0xFF617986)
                : Color(0xFF969899),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),

          filled: true,
          fillColor: themeManager.themeMode == ThemeMode.dark
              ? Color(0xFF1A3848)
              : Colors.white,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SvgPicture.asset(
              'assets/images/search.svg',
              width: 20,
              height: 20,
            ),
          ),

          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
