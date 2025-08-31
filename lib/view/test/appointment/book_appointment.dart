import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:melasense/res/components/main_button.dart';
import 'package:melasense/util/routes/routes_name.dart';
import 'package:melasense/view/widgets/week_days_row.dart';
import 'package:melasense/viewmodel/test_vm/schedule_appointment_vm.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';

class BookAppointment extends StatelessWidget {
  const BookAppointment({super.key});

  final String biography =
      "Dr. Robert is an esteemed Oncologist with a passion for helping patients achieve better health and overall well-being. "
      "With an extensive background in oncology, he has contributed significantly to cancer research and patient care. "
      "Over the years, he has successfully treated hundreds of patients with dedication and compassion. "
      "His approach combines advanced medical knowledge with genuine empathy, making him a trusted figure in the medical community. "
      "He firmly believes in not only offering treatment but also in guiding patients and their families emotionally during challenging times.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "Details",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: AppColor.whiteColor,
        actions: [
          Icon(Icons.more_vert, color: AppColor.blackColor),
          SizedBox(width: 5.w),
        ],
      ),
      backgroundColor: AppColor.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 34.sp,
                  backgroundImage: const AssetImage('assets/drpic.png'),
                ),
              ),
              Text(
                'Dr. Robert Chen Doe',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Oncologist at LUTH  ',
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      color: AppColor.darkgray,
                    ),
                  ),
                  Text(
                    '|',
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    ' ⭐ 4.8 ( 60 Reviews )',
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      color: AppColor.darkgray,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Container(
                padding: EdgeInsets.all(2.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.lightBlue,
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: 1.5.h,
                      children: [
                        Text(
                          'Lagos',
                          style: GoogleFonts.inter(
                            fontSize: 18.sp,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          spacing: 1.w,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColor.primaryColor,
                              size: 18.sp,
                            ),
                            Text(
                              'Location',
                              style: GoogleFonts.inter(
                                fontSize: 15.sp,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      spacing: 1.5.h,
                      children: [
                        Text(
                          '10+',
                          style: GoogleFonts.inter(
                            fontSize: 18.sp,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          spacing: 1.w,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.globe,
                              color: AppColor.primaryColor,
                              size: 18.sp,
                            ),
                            Text(
                              'YOE',
                              style: GoogleFonts.inter(
                                fontSize: 15.sp,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      spacing: 1.5.h,
                      children: [
                        Text(
                          '1000',
                          style: GoogleFonts.inter(
                            fontSize: 18.sp,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          spacing: 1.w,
                          children: [
                            Icon(
                              Icons.person,
                              color: AppColor.primaryColor,
                              size: 18.sp,
                            ),
                            Text(
                              'Patients Checked',
                              style: GoogleFonts.inter(
                                fontSize: 15.sp,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Biography',
                  style: GoogleFonts.inter(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
              SizedBox(height: 1.h),

              Consumer<ScheduleViewModel>(
                builder: (context, bioProvider, child) {
                  final showText = bioProvider.isExpanded
                      ? biography
                      : (biography.length > 120
                            ? biography.substring(0, 120) + "..."
                            : biography);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        showText,
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          color: AppColor.darkgray,
                          height: 1.4,
                        ),
                      ),
                      InkWell(
                        onTap: () => bioProvider.toggle(),
                        child: Text(
                          bioProvider.isExpanded ? "Read less" : "Read more",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              SizedBox(height: 2.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Schedules',
                  style: GoogleFonts.inter(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
              SizedBox(height: 1.h),

              Consumer<ScheduleViewModel>(
                builder: (context, vm, child) {
                  return WeekDaysRow(
                    selectedDate: vm.selectedDate,
                    onDaySelected: (day) {
                      vm.setCurrentDate(day);
                    },
                  );
                },
              ),
              SizedBox(height: 2.h),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Available Time',
                  style: GoogleFonts.inter(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              Consumer<ScheduleViewModel>(
                builder: (context, vm, child) {
                  final times = ["6:00 pm", "1:00 pm", "4:00 pm"];
                  return Row(
                    children: times.map((time) {
                      final isSelected = vm.selectedTime == time;
                      return GestureDetector(
                        onTap: () => vm.selectTime(time),
                        child: Container(
                          margin: EdgeInsets.only(right: 2.w),
                          padding: EdgeInsets.symmetric(
                            horizontal: 3.w,
                            vertical: 1.h,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isSelected
                                  ? AppColor.primaryColor
                                  : AppColor.gray,
                            ),
                            color: isSelected
                                ? AppColor.primaryColor
                                : AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(12.sp),
                          ),
                          child: Center(
                            child: Text(
                              time,
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? AppColor.whiteColor
                                    : AppColor.blackColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),

              SizedBox(height: 4.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: MainButton(
                  title: 'Book Appointment',
                  onTap: () {
                    Navigator.pop(context);
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
