import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:melasense/res/components/custom_drop_down.dart';
import 'package:melasense/res/components/square_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ShareWithDoctorPopup extends StatelessWidget {
  const ShareWithDoctorPopup({super.key});

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
            SizedBox(height: 2.h),
            Text(
              "Share with you ‘re Doctor",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select Your Doctor',
                  style: GoogleFonts.inter(
                    color: AppColor.blackColor,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            CustomDropdownField(
              label: 'Doctor',
              items: ['Dr. John Doe', 'Dr. John Doe', 'Dr. John Doe'],
              onChanged: (String? value) {},
            ),
            SizedBox(height: 3.h),
            Row(
              children: [
                Expanded(
                  child: SquareButton(
                    title: 'Cancel',
                    fontWeight: FontWeight.w500,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(width: 2.w),
                Expanded(
                  child: SquareButton(
                    title: 'Share',
                    fontWeight: FontWeight.w500,

                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
