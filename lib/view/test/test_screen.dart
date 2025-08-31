import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:melasense/res/components/square_button.dart';
import 'package:melasense/view/test/view_result.dart';
import 'package:melasense/view/widgets/begin_test_dialogue_popup.dart';
import 'package:melasense/view/widgets/circular_time_progress.dart';
import 'package:melasense/view/widgets/test_prep_popup.dart';
import 'package:melasense/viewmodel/test_vm/test_vm.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';

class NewTestScreen extends StatelessWidget {
  const NewTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "New Test",
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 6.w, right: 6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: AppColor.lightOrange,
                borderRadius: BorderRadius.circular(18.sp),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info_outline, color: AppColor.orange),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Important Preparation\n",
                            style: GoogleFonts.inter(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                          TextSpan(
                            text:
                                "For accurate results, please follow all preparation instructions before beginning your test.",
                            style: GoogleFonts.inter(
                              color: AppColor.blackColor,
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 3.h),

            Container(
              padding: EdgeInsets.all(16.sp),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(15.sp),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Device Status",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor,
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        "Reconnect",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    children: [
                      const Icon(
                        Icons.devices,
                        size: 40,
                        color: Colors.blueGrey,
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        "MelaSense Device\nConnected",
                        style: GoogleFonts.inter(
                          color: AppColor.blackColor,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 3.h),
            Consumer<TestViewModel>(
              builder: (context, vm, child) {
                if (vm.beginTest == false) {
                  return Column(
                    children: [
                      Consumer<TestViewModel>(
                        builder: (context, vm, _) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(4 * 2 - 1, (index) {
                              if (index.isOdd) {
                                return Container(
                                  width: 11.w,
                                  height: 0.3.h,
                                  color: vm.currentStep >= (index ~/ 2)
                                      ? AppColor.primaryColor
                                      : Colors.grey.shade300,
                                );
                              } else {
                                int circleIndex = index ~/ 2;
                                bool isActive = vm.currentStep == circleIndex;
                                return GestureDetector(
                                  onTap: () => vm.setStep(circleIndex),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 2.w,
                                    ),
                                    padding: EdgeInsets.all(15.sp),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isActive
                                          ? AppColor.primaryColor
                                          : Colors.grey.shade300,
                                    ),
                                    child: Text(
                                      "${circleIndex + 1}",
                                      style: GoogleFonts.inter(
                                        color: isActive
                                            ? AppColor.whiteColor
                                            : AppColor.blackColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            }),
                          );
                        },
                      ),
                      SizedBox(height: 4.h),
                      Container(
                        height: 23.h,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/test.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        "Prepare for Sampling",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 2.h),

                      Text(
                        "Do not eat, drink, smoke, or chew gum for at least 30 minutes before collecting the sample. "
                        "Wash hands thoroughly with soap and water.",
                        style: GoogleFonts.inter(
                          color: AppColor.blackColor,
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(height: 6.h),
                    ],
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CircularProcessWidget()],
                  );
                }
              },
            ),
            SizedBox(height: 6.h),
            Consumer<TestViewModel>(
              builder: (context, ref, child) {
                if (ref.remainingTime == 60) {
                  // Begin Test
                  return SquareButton(
                    title: 'Begin Test',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => TestPrepPopup(
                          onContinue: () {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (_) => BeginTestPopup(
                                onBegin: () {
                                  Navigator.pop(context);
                                  ref.setBeginTest(true);
                                  ref.startTimer();
                                },
                                onCancel: () => Navigator.pop(context),
                                onHelp: () {},
                              ),
                            );
                          },
                          onCancel: () => Navigator.pop(context),
                        ),
                      );
                    },
                    fontWeight: FontWeight.w500,
                    icon: FontAwesomeIcons.flask,
                  );
                } else if (ref.remainingTime < 60 && ref.remainingTime > 0) {
                  return SquareButton(
                    title: 'View Test',
                    textColor: AppColor.blackColor,
                    backgroundColor: AppColor.gray,
                    onTap: () {},
                    fontWeight: FontWeight.w500,
                    icon: FontAwesomeIcons.flask,
                  );
                } else {
                  return SquareButton(
                    title: 'View Test',
                    backgroundColor: AppColor.primaryColor,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const TestResult()),
                      );
                    },
                    fontWeight: FontWeight.w500,
                    icon: FontAwesomeIcons.flask,
                  );
                }
              },
            ),
            SizedBox(height: 6.h),
          ],
        ),
      ),
    );
  }
}
