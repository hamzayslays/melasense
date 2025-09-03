import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainButton extends StatelessWidget {
  final bool loading;
  final String title;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final IconData? icon;
  final Color? iconColor;

  const MainButton({
    super.key,
    required this.title,
    required this.onTap,
    this.loading = false,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 6.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColor.primaryColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: 4.sp,
          ),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      Icon(
                        icon,
                        color: iconColor ?? (textColor ?? Colors.white),
                        size: 18.sp,
                      ),
                      SizedBox(width: 2.w),
                    ],
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: textColor ?? Colors.white,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
