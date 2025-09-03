import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BeginTestDialog extends StatelessWidget {
  final VoidCallback onBegin;
  final VoidCallback onCancel;
  final VoidCallback onHelp;

  const BeginTestDialog({
    super.key,
    required this.onBegin,
    required this.onCancel,
    required this.onHelp,
  });

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
              "Begin Test?",
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              "Make sure you've completed all preparation steps and your device is ready.",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 15.sp,
                color: AppColor.blackColor,
              ),
            ),
            SizedBox(height: 3.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onCancel,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey.shade400),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.inter(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onBegin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                    ),
                    child: Text(
                      "Begin",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            OutlinedButton(
              onPressed: onHelp,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey.shade400),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Help",
                style: GoogleFonts.inter(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
