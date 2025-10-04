import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/Best_hotels_info_card.dart';
import '../widgets/drawer_item.dart';
import '../widgets/hotels_details_card.dart';

/// ================== GetX Controller ==================
class HomeController extends GetxController {
  final AdvancedDrawerController drawerController = AdvancedDrawerController();
  RxInt selectedDrawerIndex = 0.obs;
  RxInt selectedChipIndex = 0.obs;

  void selectDrawerItem(int index) {
    selectedDrawerIndex.value = index;
    drawerController.hideDrawer();
  }

  void selectChip(int index) {
    selectedChipIndex.value = index;
  }

  void openDrawer() => drawerController.showDrawer();
}

/// ================== Myhomepage ==================
class Myhomepage extends StatelessWidget {
  Myhomepage({super.key});

  final HomeController controller = Get.put(HomeController());

  final List<String> chipLabels = ["House", "Apartment", "Hotel", "Villa", "Cottage"];

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: GoogleFonts.raleway(color: Colors.black, fontSize: 14.sp),
      child: AdvancedDrawer(
        controller: controller.drawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        backdropColor: Colors.blue,
        rtlOpening: false,
        openScale: 0.85,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),

        /// ================= Drawer Content =================
        drawer: SafeArea(
          child: FractionallySizedBox(
            child: ListTileTheme(
              textColor: Colors.white,
              iconColor: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),

                  Obx(() => CustomDrawerItem(
                    iconPath: "assets/icons/home_icon.png",
                    title: "Home",
                    isSelected: controller.selectedDrawerIndex.value == 0,
                    onTap: () => controller.selectDrawerItem(0),
                  )),
                  Obx(() => CustomDrawerItem(
                    iconPath: "assets/icons/person_icon.png",
                    title: "Profile",
                    isSelected: controller.selectedDrawerIndex.value == 1,
                    onTap: () => controller.selectDrawerItem(1),
                  )),
                  Obx(() => CustomDrawerItem(
                    iconPath: "assets/icons/location_icon.png",
                    title: "Nearby",
                    isSelected: controller.selectedDrawerIndex.value == 2,
                    onTap: () => controller.selectDrawerItem(2),
                  )),

                  const Padding(
                    padding: EdgeInsets.only(right: 90),
                    child: Divider(color: Colors.white),
                  ),

                  Obx(() => CustomDrawerItem(
                    iconPath: "assets/icons/boorkmark_icon.png",
                    title: "Bookmark",
                    isSelected: controller.selectedDrawerIndex.value == 3,
                    onTap: () => controller.selectDrawerItem(3),
                  )),
                  Obx(() => CustomDrawerItem(
                    iconPath: "assets/icons/notification_icon.png",
                    title: "Notification",
                    isSelected: controller.selectedDrawerIndex.value == 4,
                    showBadge: true,
                    onTap: () => controller.selectDrawerItem(4),
                  )),
                  Obx(() => CustomDrawerItem(
                    iconPath: "assets/icons/message_icon.png",
                    title: "Message",
                    isSelected: controller.selectedDrawerIndex.value == 5,
                    showBadge: true,
                    onTap: () => controller.selectDrawerItem(5),
                  )),

                  const Padding(
                    padding: EdgeInsets.only(right: 90),
                    child: Divider(color: Colors.white),
                  ),

                  Obx(() => CustomDrawerItem(
                    iconPath: "assets/icons/settings_icon.png",
                    title: "Settings",
                    isSelected: controller.selectedDrawerIndex.value == 6,
                    onTap: () => controller.selectDrawerItem(6),
                  )),
                  Obx(() => CustomDrawerItem(
                    iconPath: "assets/icons/question_icon.png",
                    title: "Help",
                    isSelected: controller.selectedDrawerIndex.value == 7,
                    onTap: () => controller.selectDrawerItem(7),
                  )),
                  Obx(() => CustomDrawerItem(
                    iconPath: "assets/icons/logout_icon.png",
                    title: "Logout",
                    isSelected: controller.selectedDrawerIndex.value == 8,
                    onTap: () => controller.selectDrawerItem(8),
                  )),

                  const Spacer(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),

        /// ================= Main Screen =================
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(17.w),
                child: Column(
                  children: [
                    /// ================= Custom AppBar =================
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Location",
                              style: GoogleFonts.raleway(color: Colors.grey, fontSize: 12.sp),
                            ),
                            SizedBox(height: 5.h),
                            GestureDetector(
                              onTap: controller.openDrawer,
                              child: Row(
                                children: [
                                  Text(
                                    "Jakarta ",
                                    style: GoogleFonts.raleway(
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    size: 22.sp,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),

                        /// Bell Icon with red dot
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ImageIcon(
                              const AssetImage("assets/icons/bell_icon.png"),
                              color: Colors.black,
                              size: 25.sp,
                            ),
                            Positioned(
                              right: -1.1.w,
                              top: -1.1.h,
                              child: Container(
                                height: 10.h,
                                width: 10.w,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 1.w),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 15.h),

                    /// ================= Search Bar =================
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: GoogleFonts.raleway(color: Colors.black),
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(10.w),
                                child: ImageIcon(
                                  const AssetImage("assets/icons/search_icon.png"),
                                  color: Colors.grey,
                                  size: 20.sp,
                                ),
                              ),
                              hintText: "Search address, or near you ",
                              hintStyle: GoogleFonts.raleway(color: Colors.grey, fontSize: 12.sp),
                              filled: true,
                              fillColor: const Color(0xFFF7F7F7),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5.w),

                        /// Gradient filter icon
                        Container(
                          height: 48.h,
                          width: 48.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFA0DAFB), Color(0xFF0A8ED9)],
                            ),
                          ),
                          child: Center(
                            child: ImageIcon(
                              const AssetImage("assets/icons/filter_icon.png"),
                              color: Colors.white,
                              size: 22.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),

                    /// ================= Category Chips =================
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Obx(
                            () => Wrap(
                          spacing: 8.w,
                          children: List.generate(chipLabels.length, (index) {
                            bool isSelected = controller.selectedChipIndex.value == index;
                            return InkWell(
                              onTap: () => controller.selectChip(index),
                              child: Container(
                                height: 34.h,
                                width: 69.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  gradient: isSelected
                                      ? const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Color(0xFFA0DAFB), Color(0xFF0A8ED9)],
                                  )
                                      : null,
                                  color: isSelected ? null : const Color(0xFFF7F7F7),
                                ),
                                child: Text(
                                  chipLabels[index],
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.raleway(
                                    color: isSelected ? Colors.white : Colors.grey,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h),

                    /// ================= Near from you =================
                    Row(
                      children: [
                        Text("Near from you", style: GoogleFonts.raleway(color: Colors.black, fontSize: 16.sp)),
                        const Spacer(),
                        Text("See more", style: GoogleFonts.raleway(color: Colors.grey, fontSize: 12.sp)),
                      ],
                    ),
                    SizedBox(height: 25.h),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          HotelsDetailsCard(
                            title: "Dreamsville House",
                            subtitle: "Jl. Sultan Iskandar Muda",
                            image: "assets/images/villa_image1.jpg",
                          ),
                          SizedBox(width: 25.w),
                          HotelsDetailsCard(
                            title: "Ascot House",
                            subtitle: "Jl. Cilandak Tengah",
                            image: "assets/images/villa_image2.jpg",
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 25.h),

                    /// ================= Best for you =================
                    Row(
                      children: [
                        Text("Best for you", style: GoogleFonts.raleway(color: Colors.black, fontSize: 16.sp)),
                        const Spacer(),
                        Text("See more", style: GoogleFonts.raleway(color: Colors.grey, fontSize: 12.sp)),
                      ],
                    ),
                    SizedBox(height: 15.h),

                    Best_hotels_info_card(
                      title: 'Orchad House',
                      subtitle: 'Rp. 2,500.000.000 / year',
                      image: 'assets/images/house1.jpg',
                      bedrooms: '6 Bedroom',
                      bathroom: '2 Bathroom', controller: null,
                    ),
                    SizedBox(height: 15.h),
                    Best_hotels_info_card(
                      title: 'The Hollies House',
                      subtitle: "Rp. 2.000.000.000 / Year",
                      image: "assets/images/house2.jpg",
                      bedrooms: '4 Bedroom',
                      bathroom: '2 Bathroom', controller: null,
                    ),
                    SizedBox(height: 15.h),
                    Best_hotels_info_card(
                      title: 'Sea Breezes House',
                      subtitle: "Rp. 2.000.000.000 / Year",
                      image: "assets/images/house3.jpg",
                      bedrooms: '4 Bedroom',
                      bathroom: '2 Bathroom', controller: null,
                    ),



                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
