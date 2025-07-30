import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
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
              const Text(
                'My Flat',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF05161B),
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
        title: const Text(
          'Good morning',
          style: TextStyle(
            color: Color(0xFF969899),
            fontSize: 12,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: const Text(
          'Amelia Barlow',
          style: TextStyle(
            color: Color(0xFF05161B),
            fontSize: 16,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
