import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:melasense/res/components/custom_drop_down.dart';
import 'package:melasense/res/components/custom_text_field.dart';
import 'package:melasense/res/components/square_button.dart';
import 'package:melasense/util/routes/routes_name.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controller = TextEditingController();
  List<String> items = ['Patient', 'Doctor', 'Health Care Provider'];

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
                  'Login',
                  style: GoogleFonts.inter(
                    fontSize: 22.sp,
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
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 6.h),
              SquareButton(
                title: 'Login',
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.bottomNav);
                },
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Center(child: Text('Or Sign In with')),
              ),

              Row(
                spacing: 3.w,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 3.h,
                    child: Image.asset('assets/google.png'),
                  ),
                  SizedBox(height: 3.h, child: Image.asset('assets/apple.png')),

                  Icon(Icons.facebook, color: Colors.blue),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RouteNames.signupScreen);
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 6.h),
            ],
          ),
        ),
      ),
    );
  }
}
