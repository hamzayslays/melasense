import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:melasense/res/components/square_button.dart';
import 'package:melasense/util/routes/routes_name.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool checkupAlerts = true;
  bool articleRecommendations = false;
  bool highContrastMode = true;
  String textSize = "Small";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          "Settings",
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 34.sp,
              backgroundImage: const AssetImage("assets/userpic.png"),
            ),
            SizedBox(height: 1.h),
            Text(
              "John Doe",
              style: GoogleFonts.inter(
                fontSize: 19.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 0.5.h),
            Text(
              "Emma.Thompson@Example.Com",
              style: GoogleFonts.inter(
                fontSize: 15.sp,
                color: AppColor.blackColor,
              ),
            ),
            SizedBox(height: 1.5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.w),
              child: SquareButton(
                title: "Edit Profile",
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.editProfile);
                },
              ),
            ),
            SizedBox(height: 3.h),
            Divider(),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Preferences & Settings",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Notification Preferences",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              activeThumbColor: AppColor.primaryColor,

              title: Text(
                "Check-up Alerts",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                "Receive Test Alerts",
                style: GoogleFonts.inter(fontSize: 14.sp),
              ),
              value: checkupAlerts,
              onChanged: (val) => setState(() => checkupAlerts = val),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              activeThumbColor: AppColor.primaryColor,
              title: Text(
                "Article Recommendations",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                "Personalized content updates",
                style: GoogleFonts.inter(fontSize: 14.sp),
              ),
              value: articleRecommendations,
              onChanged: (val) => setState(() => articleRecommendations = val),
            ),
            Divider(),

            // Accessibility
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Accessibility Features",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
            SwitchListTile(
              activeThumbColor: AppColor.primaryColor,
              contentPadding: EdgeInsets.zero,
              title: Text(
                "High Contrast Mode",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                "Enabling high-contrast color schemes",
                style: GoogleFonts.inter(fontSize: 14.sp),
              ),
              value: highContrastMode,
              onChanged: (val) => setState(() => highContrastMode = val),
            ),

            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Text Scaling",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                "Change text size",
                style: GoogleFonts.inter(fontSize: 14.sp),
              ),
              trailing: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  value: textSize,
                  underline: const SizedBox(),
                  isDense: true,
                  items: ["Small", "Medium", "Large"].map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e, style: GoogleFonts.inter(fontSize: 15.sp)),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => textSize = val!),
                ),
              ),
            ),

            Divider(),

            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.help_outline, color: Colors.black),
              title: Text(
                "Help & Support",

                style: GoogleFonts.inter(fontSize: 16.sp),
              ),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, RouteNames.helpSupport);
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.logout_outlined, color: Colors.black),
              title: Text("Logout", style: GoogleFonts.inter(fontSize: 16.sp)),
              onTap: () {},
            ),

            SizedBox(height: 2.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Privacy policy",
                  style: GoogleFonts.inter(
                    color: AppColor.blackColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                SizedBox(width: 5.w),
                Text(
                  "Terms of Service",
                  style: GoogleFonts.inter(
                    color: AppColor.blackColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }
}
