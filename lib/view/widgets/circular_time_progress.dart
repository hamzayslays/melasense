import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:melasense/res/components/square_button.dart';
import 'package:melasense/viewmodel/test_vm/test_vm.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CircularProcessWidget extends StatelessWidget {
  const CircularProcessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TestViewModel>(
      builder: (context, vm, child) {
        String minutes = (vm.remainingTime ~/ 60).toString().padLeft(2, '0');
        String seconds = (vm.remainingTime % 60).toString().padLeft(2, '0');

        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.all(Radius.circular(16.sp)),
          ),
          height: 54.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 4.h),

              Center(
                child: Text(
                  "Processing Your Sample",
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),

              SizedBox(height: 4.h),

              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 40.w,
                    height: 18.h,
                    child: CircularProgressIndicator(
                      value: vm.progress,
                      strokeWidth: 16.sp,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColor.primaryColor,
                      ),
                      backgroundColor: Colors.grey.shade300,
                    ),
                  ),
                  vm.remainingTime > 0
                      ? Column(
                          children: [
                            Text(
                              "$minutes:$seconds",
                              style: GoogleFonts.inter(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColor.blackColor,
                              ),
                            ),
                            Text(
                              "remaining",
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          "Done",
                          style: GoogleFonts.inter(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor,
                          ),
                        ),
                ],
              ),

              SizedBox(height: 5.h),

              Consumer<TestViewModel>(
                builder: (context, vm, child) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.h),
                    child: vm.remainingTime > 0
                        ? Text(
                            "Please keep the device on a flat surface.",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          )
                        : Text(
                            "Your sample has been successfully analyzed for Notch1 protein levels.",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                  );
                },
              ),
              SizedBox(height: 4.h),
              Consumer<TestViewModel>(
                builder: (context, vm, child) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.h),
                    child: vm.remainingTime > 0
                        ? SquareButton(
                            fontWeight: FontWeight.w500,
                            backgroundColor: AppColor.whiteColor,
                            textColor: AppColor.primaryColor,
                            borderColor: AppColor.primaryColor,
                            title: 'Cancel Test',
                            onTap: () {
                              vm.stopTimer();
                              Navigator.pop(context);
                            },
                          )
                        : SquareButton(
                            fontWeight: FontWeight.w500,
                            backgroundColor: AppColor.whiteColor,
                            textColor: AppColor.primaryColor,
                            borderColor: AppColor.primaryColor,
                            title: 'Redo Test',
                            onTap: () {
                              vm.stopTimer();
                              vm.setBeginTest(true);
                            },
                          ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
