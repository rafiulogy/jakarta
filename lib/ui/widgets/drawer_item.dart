import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawerItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showBadge;

  const CustomDrawerItem({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.showBadge = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 90.0),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 30.0),
        onTap: onTap,
        leading: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              iconPath,
              height: 24,
              width: 24,
              color: isSelected ? Colors.blue : Colors.white,
            ),
            if (showBadge)
              Positioned(
                right: -2,
                top: -2,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
        title: Text(
          title,
          style: GoogleFonts.raleway(
            color: isSelected ? Colors.blue : Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14, // 👈 adjusted size for better balance
          ),
        ),
        tileColor: isSelected ? Colors.white : Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
    );
  }
}
