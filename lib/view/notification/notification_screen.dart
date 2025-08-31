import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,

        title: Text(
          "Notifications",
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColor.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                      color: AppColor.lightRed,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.warning, color: AppColor.red, size: 22),
                  ),
                  SizedBox(width: 3.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Critical Alerts',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 0.5.h),
                        Text(
                          'Your Notch1 level is higher than the normal range. Please consult your doctor.',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                        ),
                        Text(
                          'April 22, 2025 • 2:45 PM',
                          style: GoogleFonts.inter(
                            color: Colors.grey,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h),
            Divider(),
            SizedBox(height: 1.h),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                      color: AppColor.lightgreen,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.medical_services,
                      color: AppColor.green,
                      size: 22,
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Doctor / Healthcare Provider',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 0.5.h),
                        Text(
                          'Dr. Chen Doe has approved your association request.',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                        ),
                        Text(
                          'April 22, 2025 • 2:45 PM',
                          style: GoogleFonts.inter(
                            color: Colors.grey,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h),
            Divider(),
            SizedBox(height: 1.h),
          ],
        ),
      ),
    );
  }
}
