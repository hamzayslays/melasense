import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:melasense/res/components/custom_dob_field.dart';
import 'package:melasense/res/components/custom_drop_down.dart';
import 'package:melasense/res/components/custom_text_field.dart';
import 'package:melasense/res/components/square_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController passcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController dobcontroller = TextEditingController();

  List<String> associateDoctor = ['Dr Chen Doe', 'Dr Patrick', 'Dr Anna'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,

        title: Text(
          "Edit Profile",
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4.h),
              Center(
                child: CircleAvatar(
                  radius: 34.sp,
                  backgroundImage: const AssetImage("assets/userpic.png"),
                ),
              ),
              SizedBox(height: 4.h),

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
              CustomTextField(
                controller: emailcontroller,
                label: 'Email Address',
              ),
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
              CustomTextField(controller: passcontroller, label: 'Password'),

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
                  'Associated Doctor',
                  style: GoogleFonts.inter(
                    color: AppColor.blackColor,
                    fontSize: 16.sp,
                  ),
                ),
              ),

              CustomDOBField(
                controller: dobcontroller,
                label: 'Date of Birth',
                dateFormat: 'dd/MM/yyyy',
                minAge: 18,
                maxAge: 100,
                onDateSelected: (date) {},
              ),

              SizedBox(height: 6.h),
              SquareButton(title: 'Save Changes', onTap: () {}),
              SizedBox(height: 2.h),
              SquareButton(
                title: 'Cancel',
                backgroundColor: AppColor.whiteColor,
                borderColor: AppColor.darkgray,
                textColor: AppColor.darkgray,
                onTap: () {},
              ),
              SizedBox(height: 6.h),
            ],
          ),
        ),
      ),
    );
  }
}
