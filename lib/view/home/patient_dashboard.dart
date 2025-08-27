import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:melasense/res/components/square_button.dart';
import 'package:melasense/util/routes/routes_name.dart';
import 'package:melasense/view/widgets/risk_chart_graph_widget.dart';
import 'package:melasense/view/widgets/test_result_card_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 6.w, right: 6.w, top: 6.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24.sp,
                      backgroundImage: AssetImage('assets/userpic.png'),
                    ),
                    SizedBox(width: 3.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi! John Doe",
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Welcome Back",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.messageScreen);
                      },
                      child: FaIcon(FontAwesomeIcons.commentDots),
                    ),
                    SizedBox(width: 2.w),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteNames.notificationScreen,
                        );
                      },
                      child: FaIcon(FontAwesomeIcons.bell),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 3.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(15.sp),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "MELASENSE Monitor",
                          style: GoogleFonts.inter(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 1.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.sp),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Last Test",
                                style: GoogleFonts.inter(
                                  fontSize: 15.sp,
                                  color: AppColor.blackColor,
                                ),
                              ),
                              Text(
                                "7 Day Ago",
                                style: GoogleFonts.inter(
                                  fontSize: 16.sp,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    "Regular testing helps detect early signs of nodular melanoma",
                    style: GoogleFonts.inter(
                      fontSize: 17.sp,
                      color: AppColor.whiteColor,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  SquareButton(
                    title: 'Start New Test',
                    onTap: () {},
                    backgroundColor: AppColor.whiteColor,
                    textColor: AppColor.primaryColor,
                  ),
                ],
              ),
            ),

            SizedBox(height: 3.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your Health Status",
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.viewAllTest);
                  },
                  child: Text(
                    "View All",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
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
                        horizontal: 2.w,
                        vertical: 2.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '6-Month Trend',
                            style: TextStyle(
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
            SizedBox(height: 2.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Test Results",
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.viewAllTest);
                  },
                  child: Text(
                    "View All",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),

            TestResultCard(
              value: "2.4 ng/ml",
              status: "Normal",
              color: AppColor.green,
              bgColor: AppColor.lightgreen,
              date: 'April 28, 2025',
              time: '10:34 AM',
              onTap: () {
                Navigator.pushNamed(context, RouteNames.testResultScreen);
              },
            ),
            TestResultCard(
              value: "2.4 ng/ml",
              status: "Moderate",
              color: AppColor.orange,
              bgColor: AppColor.lightOrange,
              date: 'April 28, 2025',
              time: '10:34 AM',
              onTap: () {
                Navigator.pushNamed(context, RouteNames.testResultScreen);
              },
            ),
            TestResultCard(
              value: "2.4 ng/ml",
              status: "High Risk",
              color: AppColor.red,
              bgColor: AppColor.lightRed,
              date: 'April 28, 2025',
              time: '10:34 AM',
              onTap: () {
                Navigator.pushNamed(context, RouteNames.testResultScreen);
              },
            ),

            SizedBox(height: 2.h),

            Text(
              "Doctor",
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 2.h),

            DoctorCard(
              name: "Dr. Robert Chen Doe",
              role: "Dermatology Specialist",
              imageUrl: 'assets/drpic.png',
            ),

            SizedBox(height: 2.h),

            Text(
              "My Appointments",
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 2.h),

            AppointmentCard(
              doctor: "Dr. Robert Chen Doe",
              date: "15 July,2025",
              time: "04:00pm",
              imageUrl: 'assets/drpic.png',
            ),
            AppointmentCard(
              doctor: "Dr. Peterson",
              date: "15 July,2025",
              time: "04:00pm",
              imageUrl: 'assets/drpic2.png',
            ),

            SizedBox(height: 2.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Education Hub",
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "View All",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),

            SizedBox(
              height: 26.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  EducationCard(
                    title: 'Melanoma Basics',
                    subtitle: '5 Min read',
                    imagePath: 'assets/hub.png',
                  ),
                  EducationCard(
                    title: 'Melanoma Basics',
                    subtitle: '5 Min read',
                    imagePath: 'assets/hub1.png',
                  ),
                  EducationCard(
                    title: 'Melanoma Basics',
                    subtitle: '5 Min read',
                    imagePath: 'assets/hub.png',
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

class DoctorCard extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;

  const DoctorCard({
    super.key,
    required this.name,
    required this.role,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.whiteColor,
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22.sp,
                backgroundImage: AssetImage(imageUrl),
              ),
              SizedBox(width: 2.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    role,
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
              ),

              child: const Text("Details"),
            ),
          ),
        ],
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String doctor;
  final String date;
  final String time;
  final String imageUrl; // doctor image

  const AppointmentCard({
    super.key,
    required this.doctor,
    required this.date,
    required this.time,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      color: AppColor.whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Doctor image + details
          Row(
            children: [
              CircleAvatar(
                radius: 24, // size of circle
                backgroundImage: AssetImage(imageUrl),
              ),
              SizedBox(width: 3.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    "$date | $time",
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: AppColor.darkgray,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Details button
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
              ),

              child: const Text("Details"),
            ),
          ),
        ],
      ),
    );
  }
}

class EducationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath; // asset image path

  const EducationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      margin: EdgeInsets.only(right: 4.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(15.sp),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image section
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                height: 15.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // text section
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackColor,
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    color: AppColor.darkgray,
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
