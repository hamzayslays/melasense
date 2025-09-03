import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:melasense/res/components/main_button.dart';
import 'package:melasense/util/routes/routes_name.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget onboardingPage1() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 6.h),
        Container(height: 8.h, child: Image.asset('assets/logo.png')),
        SizedBox(height: 5.h),
        Stack(
          children: [
            Center(child: Image.asset('assets/shape.png')),
            Center(child: Image.asset('assets/onbording1.png')),
          ],
        ),

        SizedBox(height: 4.h),
        Text(
          'Welcome to MELASENSE',
          style: GoogleFonts.notoSans(
            fontSize: 21.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColor,
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
          child: Text(
            'Your personal healthcare companion ',
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSans(
              fontSize: 16.sp,
              color: AppColor.blackColor,
            ),
          ),
        ),

        Padding(
          // padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
          padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 6.h),
          child: Text(
            'Swipe to learn how it works',
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSans(
              fontSize: 16.sp,
              color: AppColor.blackColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 6.h, left: 8.w, right: 8.w),
          child: Text(
            'Skip Tutorial',
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSans(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget onboardingPage2() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 6.h),
        Container(height: 8.h, child: Image.asset('assets/logo.png')),
        SizedBox(height: 5.h),
        Stack(
          children: [
            Center(child: Image.asset('assets/shape.png')),
            Center(child: Image.asset('assets/onbording2.png')),
          ],
        ),

        SizedBox(height: 4.h),
        Text(
          'Melanoma Testing',
          style: GoogleFonts.notoSans(
            fontSize: 21.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColor,
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
          child: Text(
            'Our proprietary biosensor detects melanoma ',
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSans(
              fontSize: 16.sp,
              color: AppColor.blackColor,
            ),
          ),
        ),
        SizedBox(height: 1.h),

        Image.asset('assets/play.png'),
        SizedBox(height: 1.h),

        Padding(
          padding: EdgeInsets.only(bottom: 2.h, left: 8.w, right: 8.w),
          child: Text(
            'Skip Tutorial',
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSans(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget onboardingPage3() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 6.h),
        Container(height: 8.h, child: Image.asset('assets/logo.png')),
        SizedBox(height: 5.h),
        Stack(
          children: [
            Center(child: Image.asset('assets/shape.png')),
            Center(child: Image.asset('assets/onbording3.png')),
          ],
        ),

        SizedBox(height: 4.h),
        Text(
          'Track Your Results',
          style: GoogleFonts.notoSans(
            fontSize: 21.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColor,
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 1.h),
          child: Text(
            'Biomarkers are used to assess melanoma risk with clinical accuracy',
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSans(
              fontSize: 16.sp,
              color: AppColor.blackColor,
            ),
          ),
        ),
        SizedBox(height: 1.h),

        Image.asset('assets/play.png'),
        SizedBox(height: 1.h),

        Padding(
          padding: EdgeInsets.only(bottom: 2.h, left: 8.w, right: 8.w),
          child: Text(
            'Skip Tutorial',
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSans(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget onboardingPage4(BuildContext context) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 6.h),
        Container(height: 8.h, child: Image.asset('assets/logo.png')),
        SizedBox(height: 5.h),
        Stack(
          children: [
            Center(child: Image.asset('assets/shape.png')),
            Center(child: Image.asset('assets/onbording4.png')),
          ],
        ),

        SizedBox(height: 4.h),
        Text(
          'Early Detection and Monitoring Saves Lives',
          textAlign: TextAlign.center,
          style: GoogleFonts.notoSans(
            fontSize: 21.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 6.h),
          child: MainButton(
            title: 'Get Started',
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteNames.loginScreen,
                (_) => false,
              );
            },
          ),
        ),
      ],
    ),
  );
}
