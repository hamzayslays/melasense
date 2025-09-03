import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:melasense/res/colors.dart';
import 'package:melasense/res/components/square_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDateRangeDialog extends StatefulWidget {
  final DateTime? initialStart;
  final DateTime? initialEnd;

  final void Function(DateTime? start, DateTime? end) onApply;

  const CustomDateRangeDialog({
    super.key,
    this.initialStart,
    this.initialEnd,
    required this.onApply,
  });

  @override
  State<CustomDateRangeDialog> createState() => _CustomDateRangeDialogState();
}

class _CustomDateRangeDialogState extends State<CustomDateRangeDialog> {
  DateTime? startDate;
  DateTime? endDate;
  final dateFormat = DateFormat("dd-MMM-yyyy");

  @override
  void initState() {
    super.initState();
    startDate = widget.initialStart;
    endDate = widget.initialEnd;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

      insetPadding: EdgeInsets.symmetric(horizontal: 5.w),

      content: SizedBox(
        width: 90.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Custom Date Range",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
              ),
            ),
            SizedBox(height: 3.h),

            Align(
              alignment: Alignment.centerLeft,
              child: const Text("Start Date"),
            ),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: startDate == null
                    ? "Select Start Date"
                    : dateFormat.format(startDate!),
                suffixIcon: const Icon(Icons.calendar_today),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                ),
              ),
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: startDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() => startDate = picked);
                }
              },
            ),
            SizedBox(height: 2.h),

            Align(
              alignment: Alignment.centerLeft,
              child: const Text("End Date"),
            ),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: endDate == null
                    ? "Select End Date"
                    : dateFormat.format(endDate!),
                suffixIcon: const Icon(Icons.calendar_today),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                ),
              ),
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: endDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() => endDate = picked);
                }
              },
            ),
            SizedBox(height: 2.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: SquareButton(
                    title: 'Reset',
                    fontWeight: FontWeight.w500,
                    onTap: () {
                      setState(() {
                        startDate = null;
                        endDate = null;
                      });
                    },
                    textColor: AppColor.primaryColor,
                    borderColor: AppColor.primaryColor,
                    backgroundColor: AppColor.whiteColor,
                  ),
                ),
                SizedBox(width: 8.w),
                Flexible(
                  child: SquareButton(
                    title: 'Apply',
                    onTap: () {
                      Navigator.pop(context);
                      widget.onApply(startDate, endDate);
                    },
                    fontWeight: FontWeight.w500,
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
