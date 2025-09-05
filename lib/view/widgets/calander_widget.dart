import 'package:flutter/material.dart';
import 'package:melasense/res/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarWidget extends StatefulWidget {
  final Function(DateTime)? onDaySelected;

  const CalendarWidget({super.key, this.onDaySelected});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: _focusedDay,

      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },

      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });

        if (widget.onDaySelected != null) {
          widget.onDaySelected!(selectedDay);
        }
      },

      calendarFormat: CalendarFormat.month,
      startingDayOfWeek: StartingDayOfWeek.monday,

      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        leftChevronVisible: true,
        rightChevronVisible: true,
        leftChevronIcon: Icon(
          Icons.arrow_back_ios,
          size: 18.sp,
          color: Colors.black,
        ),
        rightChevronIcon: Icon(
          Icons.arrow_forward_ios,
          size: 18.sp,
          color: Colors.black,
        ),
        titleTextStyle: GoogleFonts.inter(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        headerMargin: EdgeInsets.only(bottom: 2.h),
      ),

      calendarStyle: CalendarStyle(
        isTodayHighlighted: true,
        todayDecoration: const BoxDecoration(
          color: Color(0xFFBFD4F9),
          shape: BoxShape.circle,
        ),
        selectedDecoration: const BoxDecoration(
          color: AppColor.primaryColor,
          shape: BoxShape.circle,
        ),
        selectedTextStyle: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        defaultTextStyle: GoogleFonts.inter(
          fontSize: 16.sp,
          color: Colors.black,
        ),
        weekendTextStyle: GoogleFonts.inter(
          fontSize: 16.sp,
          color: Colors.black,
        ),
      ),

      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        weekendStyle: GoogleFonts.inter(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
