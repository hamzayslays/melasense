import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:melasense/res/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WeekDaysRow extends StatefulWidget {
  final Function(DateTime)? onDaySelected;

  const WeekDaysRow({super.key, this.onDaySelected, DateTime? selectedDate});

  @override
  State<WeekDaysRow> createState() => _WeekDaysRowState();
}

class _WeekDaysRowState extends State<WeekDaysRow> {
  DateTime? selectedDate;

  List<DateTime> getCurrentAndNextMonthDates() {
    DateTime today = DateTime.now();
    DateTime lastDayNextMonth = DateTime(today.year, today.month + 2, 0);

    return List.generate(
      lastDayNextMonth.difference(today).inDays + 1,
      (index) => today.add(Duration(days: index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final monthDays = getCurrentAndNextMonthDates();

    return SizedBox(
      height: 9.h,
      width: 100.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: monthDays.length,
        itemBuilder: (context, index) {
          DateTime day = monthDays[index];
          String dayName = DateFormat('E').format(day);
          String dayNum = DateFormat('d').format(day);

          bool isSelected =
              selectedDate != null &&
              DateFormat('yyyy-MM-dd').format(day) ==
                  DateFormat('yyyy-MM-dd').format(selectedDate!);

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDate = day;
              });
              widget.onDaySelected?.call(day);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Container(
                width: 13.w,
                height: 8.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.sp),
                  color: isSelected
                      ? AppColor.primaryColor
                      : Colors.transparent,
                  // border: Border.all(
                  //   color: AppColor.primaryColor,
                  //   width: 0.3.w,
                  // ),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 1.h,
                  children: [
                    Text(
                      dayName,
                      style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.white : AppColor.blackColor,
                      ),
                    ),
                    Text(
                      dayNum,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: isSelected ? Colors.white : AppColor.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
