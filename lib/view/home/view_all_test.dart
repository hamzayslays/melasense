import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:melasense/util/routes/routes_name.dart';
import 'package:melasense/view/widgets/custom_date_range_popup_widget.dart';
import 'package:melasense/view/widgets/test_result_card_widget.dart';
import 'package:melasense/viewmodel/test_vm/view_all_test_vm.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewAllTest extends StatelessWidget {
  const ViewAllTest({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<TestViewModel>(context);

    return Scaffold(
      backgroundColor: AppColor.whiteColor,

      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.whiteColor,
        title: Text(
          "Test Results",
          style: GoogleFonts.inter(
            fontSize: 19.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 6.w, right: 6.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date Range',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return CustomDateRangeDialog(
                            initialStart: null,
                            initialEnd: null,
                            onApply: (start, end) {
                              debugPrint("Custom Range => $start | $end");
                            },
                          );
                        },
                      );
                    },
                    child: Text(
                      'Custom',
                      style: GoogleFonts.inter(
                        color: AppColor.primaryColor,
                        fontStyle: FontStyle.italic,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _filterChip("7", "Last 7 Days", vm),
                  SizedBox(width: 2.w),
                  _filterChip("30", "Last 30 Days", vm),
                  SizedBox(width: 2.w),
                  _filterChip("90", "Last 3 Months", vm),
                ],
              ),
              SizedBox(height: 3.h),

              ...vm.filteredTests.map((test) {
                return TestResultCard(
                  value: test["value"],
                  status: test["status"],
                  color: test["color"],
                  bgColor: test["bgColor"],
                  date: test["date"],
                  time: test["time"],
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.testResultScreen);
                  },
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _filterChip(String key, String label, TestViewModel vm) {
    bool isSelected = vm.selectedFilter == key;
    return InkWell(
      onTap: () => vm.changeFilter(key),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColor.blackColor,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }
}
