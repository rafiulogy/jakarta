import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Best_hotels_info_card extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image; // background image
  final String bedrooms;
  final String bathroom;

  const Best_hotels_info_card({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.bedrooms,
    required this.bathroom, required controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Hotel image with rounded corners
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Image.asset(
            image,
            height: 70.h,
            width: 80.w,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 20.w),

        /// Hotel Info
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.raleway(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5.w),

            Text(
              subtitle,
              style: GoogleFonts.raleway(
                color: Colors.blue,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 5.w),

            /// Bedroom + Bathroom Row
            Row(
              children: [
                const ImageIcon(
                  AssetImage("assets/icons/bed_icon.png"),
                  color: Colors.grey,
                ),
                SizedBox(width: 8.w),
                Text(
                  bedrooms,
                  style: GoogleFonts.raleway(
                    color: Colors.grey,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(width: 20.w),
                const ImageIcon(
                  AssetImage("assets/icons/bathtub_icon.png"),
                  color: Colors.grey,
                ),
                SizedBox(width: 8.w),
                Text(
                  bathroom,
                  style: GoogleFonts.raleway(
                    color: Colors.grey,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}