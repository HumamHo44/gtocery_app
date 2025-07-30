import 'package:flutter/material.dart';
import 'package:gtocery_app/home/profile_page.dart';
import 'package:gtocery_app/home/widgets/custom_bottom_nav_bar.dart';
import 'package:gtocery_app/home/widgets/home_page_body.dart';
import 'package:provider/provider.dart';
import 'package:gtocery_app/theme_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final List<Widget> pages = const [HomePageBody(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return Scaffold(
      backgroundColor: themeManager.themeMode == ThemeMode.dark
          ? Colors.grey[900]
          : Colors.white,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
            scaffoldBackgroundColor: themeManager.themeMode == ThemeMode.dark
                ? Colors.grey[900]
                : Colors.white,
          ),
          child: pages[currentIndex],
        ),
      ),
    );
  }
}
