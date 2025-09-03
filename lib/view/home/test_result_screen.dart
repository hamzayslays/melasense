import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:melasense/res/components/square_button.dart';
import 'package:melasense/view/widgets/risk_chart_graph_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TestResultScreen extends StatelessWidget {
  const TestResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          "Test Results",
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.sp),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Result Summary",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                      Row(
                        spacing: 2.w,
                        children: [
                          Text(
                            "May 3, 2025",
                            style: GoogleFonts.inter(
                              color: Colors.grey,
                              fontSize: 14.sp,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.lightBlue,
                            ),
                            child: Icon(Icons.share, color: AppColor.blue),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Image.asset('assets/greencheck.png'),
                  SizedBox(height: 1.h),
                  Text(
                    "Negative",
                    style: GoogleFonts.inter(
                      color: AppColor.lightgreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.sp,
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    "No significant melanoma markers detected",
                    style: GoogleFonts.inter(
                      color: AppColor.blackColor,
                      fontSize: 15.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 2.h),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Test ID: MS-8742\n2025-05-03",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: AppColor.blackColor,
                        ),
                      ),
                      Text(
                        "Completed at\n10:45 AM",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: AppColor.blackColor,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 3.h),

            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 2.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '6-Month Trend',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: 19.sp,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          Flexible(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.lightgreen,
                              ),
                              onPressed: () {},
                              child: Text("Stable"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 7.w,
                        right: 7.w,
                        bottom: 3.h,
                      ),
                      child: SizedBox(
                        height: 40.h,
                        child: riskChart(
                          values: [1, 2.5, 3, 4, 3.5, 2, 4.5],
                          months: [
                            "Jan",
                            "Feb",
                            "Mar",
                            "Apr",
                            "May",
                            "Jun",
                            "Jul",
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 3.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Biomarkers Analysis",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15.sp),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.lightBlue,
                        ),
                        child: Text(
                          '!',
                          style: GoogleFonts.inter(
                            color: AppColor.blue,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 3.w,
                        children: [
                          Text(
                            "Notch1 Levels",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 2.w,
                              vertical: 0.3.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Normal",
                              style: GoogleFonts.inter(
                                color: Colors.green,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "18.3 Ng/ML",
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: 18.3 / 25,
                      minHeight: 8,
                      backgroundColor: Colors.grey.shade200,
                      color: Colors.green,
                    ),
                  ),

                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Normal Range: 10–25 Ng/ML",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: AppColor.blackColor,
                        ),
                      ),
                      Text(
                        "-2.1% From Last Reading",
                        style: GoogleFonts.inter(
                          fontSize: 14.sp,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                ],
              ),
            ),

            SizedBox(height: 4.h),

            SquareButton(
              title: 'Download Pdf',
              icon: Icons.file_download_outlined,
              onTap: () {},
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 1.h),
            SquareButton(
              title: 'Share Report',
              icon: Icons.share,
              onTap: () {},
              backgroundColor: AppColor.whiteColor,
              borderColor: AppColor.primaryColor,
              textColor: AppColor.primaryColor,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }
}
