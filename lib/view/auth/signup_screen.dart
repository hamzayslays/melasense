import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:melasense/res/components/custom_drop_down.dart';
import 'package:melasense/res/components/custom_text_field.dart';
import 'package:melasense/res/components/square_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController controller = TextEditingController();
  List<String> items = ['Patient', 'Doctor', 'Health Care Provider'];
  List<String> associateProvider = ['MM Hospital', 'CCH', 'Life Care Hospital'];
  List<String> associateDoctor = ['Dr Chen Doe', 'Dr Patrick', 'Dr Anna'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.h),
              Center(
                child: Container(
                  height: 8.h,
                  child: Image.asset('assets/logo.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.h, bottom: 1.h),
                child: Text(
                  'Get Started Now',
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: Text(
                  'User Type',
                  style: GoogleFonts.inter(
                    color: AppColor.blackColor,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              CustomDropdownField(
                label: 'Select User Type',
                items: items,
                onChanged: (String? value) {},
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: Text(
                  'Name',
                  style: GoogleFonts.inter(
                    color: AppColor.blackColor,
                    fontSize: 16.sp,
                  ),
                ),
              ),

              CustomTextField(controller: controller, label: 'Name'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: Text(
                  'Associated Healthcare Provider',
                  style: GoogleFonts.inter(
                    color: AppColor.blackColor,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              CustomDropdownField(
                label: 'Select Associated Healthcare Provider',
                items: associateProvider,
                onChanged: (String? value) {},
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: Text(
                  'Associated Doctor',
                  style: GoogleFonts.inter(
                    color: AppColor.blackColor,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              CustomDropdownField(
                label: 'Select Associated Doctor',
                items: associateDoctor,
                onChanged: (String? value) {},
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: Text(
                  'Email Address',
                  style: GoogleFonts.inter(
                    color: AppColor.blackColor,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              CustomTextField(controller: controller, label: 'Email Address'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: Text(
                  'Password',
                  style: GoogleFonts.inter(
                    color: AppColor.blackColor,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              CustomTextField(controller: controller, label: 'Password'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: Text(
                  'Upload Profile Photo',
                  style: GoogleFonts.inter(
                    color: AppColor.blackColor,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: Text(
                  'PNG or JPG Format',
                  style: GoogleFonts.inter(
                    color: AppColor.gray,
                    fontSize: 14.sp,
                  ),
                ),
              ),

              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    border: Border.all(
                      width: 0.5.w,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 3.h,
                      bottom: 2.h,
                      left: 3.w,
                      right: 3.w,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Click To Upload Image',
                          style: GoogleFonts.inter(
                            color: AppColor.gray,
                            fontSize: 18.sp,
                          ),
                        ),
                        Icon(
                          Icons.add_rounded,
                          size: 40.sp,
                          color: AppColor.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 6.h),
              SquareButton(title: 'Sign Up', onTap: () {}),
              SizedBox(height: 6.h),
            ],
          ),
        ),
      ),
    );
  }
}
