import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gtocery_app/theme_manager.dart';
import 'package:provider/provider.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        trailing: Container(
          width: 100,
          height: 50,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(67),
            ),
          ),
          child: Row(
            children: [
              SvgPicture.asset('assets/images/location.svg'),
              const SizedBox(width: 6),
              Text(
                'My Flat',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: themeManager.themeMode == ThemeMode.dark
                      ? Colors.white
                      : Color(0xFF05161B),
                  fontSize: 12,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
        leading: SvgPicture.asset(
          'assets/images/Maskgroup.svg',
          width: 44,
          height: 44,
        ),
        title: Text(
          'Good morning',
          style: TextStyle(
            color: themeManager.themeMode == ThemeMode.dark
                ? Color(0xFF617986)
                : Color(0xFF969899),
            fontSize: 12,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          'Amelia Barlow',
          style: TextStyle(
            color: themeManager.themeMode == ThemeMode.dark
                ? Colors.white
                : Color(0xFF05161B),
            fontSize: 16,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
