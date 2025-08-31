import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        // automaticallyImplyLeading: false,
        backgroundColor: AppColor.whiteColor,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back, color: AppColor.blackColor),
        //   onPressed: () {

        //   },
        // ),
        title: Text(
          "Early Detection",
          style: GoogleFonts.inter(
            color: AppColor.blackColor,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.bookmark_outline_outlined, color: AppColor.blackColor),
          SizedBox(width: 6.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 30.h,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/hub1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 2.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Early Detection: The Key to Melanoma Survival',
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: AppColor.gray,
                        size: 18.sp,
                      ),
                      Text(
                        '5 mint read',
                        style: GoogleFonts.inter(color: AppColor.gray),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Melanoma is the most dangerous form of skin cancer, but when detected early, the 5-year survival rate is over 98%. Unfortunately, once melanoma has spread to distant organs, that survival rate drops dramatically to less than 30%. This stark contrast highlights why early detection is absolutely crucial in the fight against this aggressive cancer.',
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      color: AppColor.blackColor,
                    ),
                  ),
                  SizedBox(height: 2.h),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Understanding Early Detection',
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  SizedBox(height: 2.h),
                  Text(
                    'Early detection of melanoma involves identifying suspicious skin changes before the cancer has a chance to grow deeper into the skin or spread to other parts of the body. The earlier melanoma is caught, the easier it is to treat and the better the prognosis.',
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      color: AppColor.blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
