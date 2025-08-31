import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ResultDownloadedPopup extends StatelessWidget {
  const ResultDownloadedPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.sp)),
      content: SizedBox(
        width: 90.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Test Result Downloaded Successfully !",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              "Check your downloads folder to view the file.",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 13.sp,
                color: AppColor.blackColor,
              ),
            ),
            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }
}
