import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../res/components/toggle_tile.dart';
import 'edit_profile_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isNotificationOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h),
              Center(
                child: CircleAvatar(
                  radius: 32.sp,
                  backgroundImage: AssetImage('assets/userpic.png'),
                ),
              ),
              SizedBox(height: 1.h),
              Align(
                alignment: Alignment.center,

                child: Text(
                  'John Doe',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp),
                ),
              ),

              Align(
                alignment: Alignment.center,
                child: Text(
                  'emma.thompson@example.com',
                  style: TextStyle(fontSize: 17.sp),
                ),
              ),
              SizedBox(height: 2.h),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => EditProfileScreen() ));
                  },
                  child: Container(
                    height: 6.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff6FA8DC),
                    ),
                    child: Center(
                      child: Text(
                        'Edit Profile',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.5.h),
              Text(
                'Preferences & Settings',
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                'Notification Preferences',
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff6FA8DC),
                ),
              ),

              ToggleTile(
                title: "Check-up Alerts",
                subtitle: "Receive Test Alerts",
              ),

              ToggleTile(
                title: "Article Recommendations",
                subtitle: 'Personalized content updates',
              ),

              Divider(),

              ToggleTile(
                title: "High Contrast Mode",
                subtitle: 'Enabling high-contrast color schemes',
              ),

              ToggleTile(
                title: "Text Scaling",
                subtitle: "Change text size",
                isDropdown: true,
                dropdownItems: ["Small", "Medium", "Large"],
                initialValue: "Small",
                onChanged: (val) {
                  print("Selected: $val");
                },
              ),

              Divider(),
              SizedBox(height: 1.h,),

              Row(
                children: [
                  Icon(Icons.help_outline),
                  SizedBox(width: 4.  w),
                  Text(
                    'Help & Support',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
              SizedBox(height: 2.h,),
              Row(
                children: [
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(3.1416), // 180° rotate horizontally
                    child: Icon(
                      Icons.logout_outlined,
                      size: 26,
                    ),
                  ),
                  SizedBox(width: 4.w,),
                  Text('Logout', style: GoogleFonts.poppins(fontSize: 18.sp,
                  fontWeight: FontWeight.w500),)
                ],
              ),
              SizedBox(height: 2.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // left-right evenly
                children: [
                  Text(
                    'Privacy Policy',
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      decoration: TextDecoration.underline, // underline lag gaya
                    ),
                  ),
                  Text(
                    'Terms of Service',
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      decoration: TextDecoration.underline, // underline lag gaya
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.h),

            ],
          ),
        ),
      ),
    );
  }
}
