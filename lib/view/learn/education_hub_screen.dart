import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:melasense/util/routes/routes_name.dart';
import 'package:melasense/viewmodel/education_hub_vm/education_hub_vm.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EducationHubScreen extends StatelessWidget {
  const EducationHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<EducationHubVM>(context);

    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),

      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.whiteColor,
        automaticallyImplyLeading: false,
        title: Text(
          "Education Hub",
          style: GoogleFonts.inter(
            color: AppColor.blackColor,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 6.h,
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: AppColor.gray),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: GoogleFonts.inter(
                                color: Colors.grey,
                                fontSize: 16.sp,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 3.w),

                IconButton(
                  icon: const Icon(Icons.more_vert, color: AppColor.blackColor),
                  onPressed: () {},
                ),
              ],
            ),

            SizedBox(height: 2.h),

            Text(
              "All",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 17.sp,
              ),
            ),

            SizedBox(height: 1.h),

            Expanded(
              child: ListView.builder(
                itemCount: vm.articles.length,
                itemBuilder: (context, index) {
                  final article = vm.articles[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.articleScreen);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.sp),
                            child: Image.asset(
                              article["image"],
                              height: 8.h,
                              width: 18.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 3.w),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article["title"],
                                  style: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                                SizedBox(height: 0.5.h),
                                Text(
                                  "${article["date"]} · ${article["time"]}",
                                  style: GoogleFonts.inter(
                                    fontSize: 14.sp,
                                    color: AppColor.gray,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          GestureDetector(
                            onTap: () => vm.toggleBookmark(index),
                            child: Icon(
                              article["bookmarked"]
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              color: article["bookmarked"]
                                  ? AppColor.primaryColor
                                  : AppColor.gray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
