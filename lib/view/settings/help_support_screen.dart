import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:melasense/res/components/square_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  List<bool> expandedList = [true, false, false, false];

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
          "Help & Support",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h),
              Text(
                "Frequently Asked Questions",
                style: GoogleFonts.inter(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 2.h),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  suffixIcon: const Icon(Icons.search, color: Colors.grey),
                  hintStyle: GoogleFonts.inter(
                    color: Colors.grey,
                    fontSize: 16.sp,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 1.5.h,
                    horizontal: 3.w,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.sp),
                    borderSide: BorderSide(
                      color: Colors.grey.shade200,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.sp),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.sp),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 2.h),

              _faqItem(
                0,
                "What is Melanoma?",
                "Melanoma is the most dangerous form of skin cancer, but when detected early, the 5-year survival rate is over 98%.",
              ),
              _faqItem(
                1,
                "What is Melanoma?",
                "Melanoma is the most dangerous form of skin cancer, but when detected early, the 5-year survival rate is over 98%.",
              ),
              _faqItem(
                2,
                "What is Melanoma?",
                "Melanoma is the most dangerous form of skin cancer, but when detected early, the 5-year survival rate is over 98%.",
              ),
              _faqItem(
                3,
                "What is Melanoma?",
                "Melanoma is the most dangerous form of skin cancer, but when detected early, the 5-year survival rate is over 98%.",
              ),

              SizedBox(height: 4.h),

              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Contact ",
                    style: GoogleFonts.inter(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "us",
                        style: GoogleFonts.inter(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              Center(
                child: Text(
                  "Didn’t find what are you looking for?\nLet’s get in touch!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    color: AppColor.blackColor,
                  ),
                ),
              ),
              SizedBox(height: 3.h),

              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: GoogleFonts.inter(
                    color: Colors.black87,
                    fontSize: 16.sp,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87, width: 1),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 0.8),
                  ),
                ),
              ),
              SizedBox(height: 2.h),

              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: GoogleFonts.inter(
                    color: Colors.black87,
                    fontSize: 16.sp,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87, width: 1),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 0.8),
                  ),
                ),
              ),

              TextFormField(
                controller: messageController,
                maxLines: 2,
                decoration: InputDecoration(
                  labelText: "Message",
                  labelStyle: GoogleFonts.inter(
                    color: Colors.black87,
                    fontSize: 16.sp,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87, width: 1),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54, width: 0.8),
                  ),
                ),
              ),
              SizedBox(height: 4.h),

              SquareButton(title: "Submit", onTap: () {}),
              SizedBox(height: 6.h),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.primaryColor,
        onPressed: () {},
        child: Image.asset('assets/ai_icon.png'),
      ),
    );
  }

  Widget _faqItem(int index, String title, String? description) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.sp),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.sp),
          ),
          title: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          trailing: Icon(
            expandedList[index]
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
          onExpansionChanged: (expanded) {
            setState(() {
              expandedList[index] = expanded;
            });
          },
          children: description != null
              ? [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 1.h,
                    ),
                    child: Text(
                      description,
                      style: GoogleFonts.inter(fontSize: 15.sp),
                    ),
                  ),
                ]
              : [],
        ),
      ),
    );
  }
}
