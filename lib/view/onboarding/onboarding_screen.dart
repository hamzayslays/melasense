import 'package:flutter/material.dart';
import 'package:melasense/res/colors.dart';
import 'package:melasense/view/onboarding/onboarding_pages.dart';
import 'package:melasense/viewmodel/onboarding_vm/onboarding_vm.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      onboardingPage1(),
      onboardingPage2(),
      onboardingPage3(),
      onboardingPage4(context),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: pages.length,
              onPageChanged: (index) {
                context.read<OnboardingVm>().setPage(index);
              },
              itemBuilder: (context, index) {
                return pages[index];
              },
            ),
          ),

          Consumer<OnboardingVm>(
            builder: (context, vm, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pages.length,
                  (index) => Container(
                    margin: EdgeInsets.only(
                      left: 1.w,
                      right: 1.w,
                      top: 1.h,
                      bottom: 7.h,
                    ),
                    height: 1.h,
                    width: vm.currentPage == index ? 30 : 10,
                    decoration: BoxDecoration(
                      color: vm.currentPage == index
                          ? AppColor.primaryColor
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
