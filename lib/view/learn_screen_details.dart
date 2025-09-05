import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../viewmodel/learn_view_model.dart';

class DetailScreen extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String title2;
  final String description2;
  final int index;

  const DetailScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.title2,
    required this.description2,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(

        title: const Text('Early Detection'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: Consumer<LearnViewModel>(
              builder: (context, viewModel, _) {
                return InkWell(
                  onTap: () => viewModel.toggleSaved(index),
                  child: Icon(
                    viewModel.isSaved(index)
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    color: viewModel.isSaved(index) ? Colors.blue : Colors.black,
                    size: 22.sp,
                  ),
                );
              },
            ),
          )
        ],
        backgroundColor: AppColor.whiteColor,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Image.asset(
              image,
              width: 100.w,
              height: 35.h,
              fit: BoxFit.cover,
            ),


            SizedBox(height: 1.h),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Title + Subtitle
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: Color(0xff6FA8DC),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 1.h),

                  Row(children: [

                    Icon(Icons.watch_later_outlined),
                    Text('5 Min read')

                  ],),
                  SizedBox(height: 1.h,),

                  Text('Melanoma is the most dangerous form of skin cancer, but when detected early, the 5-year survival rate is over 98%. Unfortunately, once melanoma has spread to distant organs, that survival rate drops dramatically to less than 30%. This stark contrast highlights why early detection is absolutely crucial in the fight against this aggressive cancer.'),


                  SizedBox(height: 1.h),

                  // Title2 + Description2
                  Text(
                    title2,
                    style: GoogleFonts.poppins(
                      color: Color(0xff6FA8DC),
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    description2,
                    style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      color: Colors.grey[700],
                    ),
                  ),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
