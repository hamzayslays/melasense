import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../res/components/custom_drop_down.dart';
import '../res/components/custom_text_field.dart';
import '../res/components/dob_picker.dart';
import '../res/components/square_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController controller = TextEditingController();
  List<String> items = ['Patient', 'Doctor', 'Health Care Provider'];
  List<String> associateProvider = ['MM Hospital', 'CCH', 'Life Care Hospital'];
  List<String> associateDoctor = ['Dr Chen Doe', 'Dr Patrick', 'Dr Anna'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        title: Text('Edit Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Profile Picture
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Center(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.asset(
                          'assets/userpic.png',
                          height: 110,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 4,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Color(0xff6FA8DC),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.photo_camera_outlined,
                            color: Colors.white,
                            size: 19.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text('Name', style: TextStyle(fontSize: 17.sp)),
              SizedBox(height: 1.h),
              CustomTextField(controller: controller, label: 'Name'),

              SizedBox(height: 1.5.h),
              Text('Email Address', style: TextStyle(fontSize: 17.sp)),
              SizedBox(height: 1.h),
              CustomTextField(controller: controller, label: 'Email'),

              SizedBox(height: 1.5.h),
              Text('Password', style: TextStyle(fontSize: 17.sp)),
              SizedBox(height: 1.h),
              CustomTextField(controller: controller, label: 'Password'),
              SizedBox(height: 1.5.h),

              Text('Associated Doctor', style: TextStyle(fontSize: 17.sp)),

              CustomDropdownField(
                label: 'Select Associated Doctor',
                items: associateDoctor,
                onChanged: (String? value) {},
              ),

              Text('Date Of Birth', style: TextStyle(fontSize: 17.sp)),


              CustomDateField(
                value: null,
                onChanged: (date) {
                  print("Selected Date: $date");
                },
              ),

              SizedBox(height: 4.h),
              SquareButton(title: 'Save Changes', onTap: () {}),
              SizedBox(height: 2.h,),
              Container(
                height: 6.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent, // background hat gaya
                  borderRadius: BorderRadius.circular(12.sp),
                  border: Border.all(
                    color: Colors.black, // stroke ka color (change kar sakte ho)
                    width: 4.sp,
                  ),
                ),
                child: Center(
                  child: Text(
                    "Cancel",
                   style: GoogleFonts.poppins(
                     fontSize: 17.sp,
                     color: Colors.black
                   ),
                  ),
                ),
              ),
              SizedBox(height: 4.h,)



            ],
          ),
        ),
      ),
    );
  }
}
