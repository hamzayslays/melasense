import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final IconData? icon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final VoidCallback? onIconTap;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.icon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.onIconTap,
    this.inputFormatters,
    this.maxLength,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      inputFormatters: widget.inputFormatters,
      maxLength: widget.maxLength,
      validator: widget.validator,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: widget.onIconTap,
          child: Icon(widget.icon, color: AppColor.primaryColor),
        ),
        labelText: widget.label,
        labelStyle: GoogleFonts.poppins(
          textStyle: TextStyle(color: AppColor.darkgray, fontSize: 16.sp),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5.w, color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(10.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(10.sp),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(width: 0.5.w, color: AppColor.primaryColor),
        ),
      ),
    );
  }
}
