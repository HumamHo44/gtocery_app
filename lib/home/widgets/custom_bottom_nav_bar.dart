import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gtocery_app/home/widgets/home_page_body.dart';
import 'package:gtocery_app/screens/Cart_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,

      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => onTap(0),
                child: NaivgationBarItem(
                  isSelected: currentIndex == 0,
                  inactiveImage: 'assets/images/outline/home.svg',
                  activeImage: 'assets/images/bold/home.svg',
                ),
              ),

              GestureDetector(
                onTap: () => onTap(1),
                child: NaivgationBarItem(
                  inactiveImage: 'assets/images/outline/profile.svg',
                  activeImage: 'assets/images/bold/profile.svg',
                  isSelected: currentIndex == 1,
                ),
              ),
            ],
          ),

          Positioned(
            top: -30,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const CartPage();
                      },
                    ),
                  );
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SvgPicture.asset(
                      'assets/images/shopping.svg',
                      width: 50,
                      height: 50,
                    ),
                    Positioned(
                      right: 12,
                      bottom: -22,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Text(
                          '0',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
