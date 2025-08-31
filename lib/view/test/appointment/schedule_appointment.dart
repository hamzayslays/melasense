import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:melasense/res/components/main_button.dart';
import 'package:melasense/util/routes/routes_name.dart';
import 'package:melasense/view/widgets/calander_widget.dart';
import 'package:melasense/viewmodel/test_vm/schedule_appointment_vm.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScheduleAppointment extends StatelessWidget {
  const ScheduleAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ScheduleViewModel>(context);

    return Scaffold(
      backgroundColor: AppColor.lightBlue,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.h),

              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios, color: Colors.black),
              ),

              SizedBox(height: 4.h),

              Center(
                child: Container(
                  padding: EdgeInsets.all(3.w),
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(12.sp),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: CalendarWidget(
                    onDaySelected: (day) {
                      vm.setDate(day);
                    },
                  ),
                ),
              ),

              SizedBox(height: 4.h),
              if (vm.selectedDate != null)
                Text(
                  vm.formattedDate,
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              SizedBox(height: 1.5.h),
              Text('Dr Smith'),
              Text("02:30 PM"),
              SizedBox(height: 2.h),
              Text(
                'Symptoms',
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 1.h),

              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: 1.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                    child: Center(
                      child: Text(
                        'Vomiting',
                        style: GoogleFonts.inter(fontSize: 13.sp),
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: 1.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                    child: Center(
                      child: Text(
                        'Increased Notch 1 Level',
                        style: GoogleFonts.inter(fontSize: 13.sp),
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 3.w,
                      vertical: 1.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                    child: Center(
                      child: Text(
                        'Temperature',
                        style: GoogleFonts.inter(fontSize: 13.sp),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.h),

              Text(
                'Notes',
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 1.h),

              Center(
                child: Container(
                  padding: EdgeInsets.all(3.w),
                  height: 10.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  child: Text(
                    'Experiencing recurring temprature with episodes of vomiting.',

                    style: GoogleFonts.inter(fontSize: 16.sp),
                  ),
                ),
              ),
              SizedBox(height: 4.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: MainButton(
                  title: 'Proceed to Booking',
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.bookAppointment);
                  },
                ),
              ),
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }
}
