import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TestResultCard extends StatelessWidget {
  final String value;
  final String status;
  final String date;
  final String time;
  final Color color;
  final Color bgColor;
  final IconData icon;
  final VoidCallback onTap;

  const TestResultCard({
    super.key,
    required this.value,
    required this.status,
    required this.date,
    required this.time,
    required this.color,
    required this.bgColor,
    this.icon = Icons.science,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h),
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 3.w,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(12.sp),
                  decoration: BoxDecoration(
                    color: bgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color, size: 22),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          value,
                          style: GoogleFonts.inter(
                            color: color,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Row(
                          children: [
                            Text(
                              '· ',
                              style: GoogleFonts.inter(
                                color: color,
                                fontWeight: FontWeight.w600,
                                fontSize: 20.sp,
                              ),
                            ),
                            Text(
                              status,
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                color: AppColor.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 0.5.h),
                    Text(
                      "$date · $time",
                      style: GoogleFonts.inter(
                        fontSize: 15.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
