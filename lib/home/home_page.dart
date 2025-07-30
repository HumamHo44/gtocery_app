import 'package:flutter/material.dart';
import 'package:gtocery_app/home/profile_page.dart';
import 'package:gtocery_app/home/widgets/custom_bottom_nav_bar.dart';
import 'package:gtocery_app/home/widgets/home_page_body.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: SafeArea(child: pages[currentIndex]),
    );
  }
}
