import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HotelsDetailsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image; // background image
  final String distance; // optional: distance text
  final String overlayImage; // optional: transparent overlay image

  const HotelsDetailsCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.distance = "1.8 Km",
    this.overlayImage = "assets/images/overlay.png",
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 222.w,
      height: 272.h,
      child: Stack(
        children: [
          /// Background image
          Container(
            width: 222.w,
            height: 272.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Transparent overlay image
          Positioned.fill(
            child: Image.asset(
              overlayImage,
              fit: BoxFit.cover,
            ),
          ),

          /// Top-right distance container
          Positioned(
            top: 15.h,
            right: 15.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: const Color(0x3D383737), // semi-transparent
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 14.sp,
                    color: Colors.white,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    distance,
                    style: GoogleFonts.raleway(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Bottom-left title and subtitle
          Positioned(
            bottom: 15.h,
            left: 15.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
