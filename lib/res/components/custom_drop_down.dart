import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDropdownField extends StatefulWidget {
  final String label;
  final List<String> items;
  final String? value;
  final void Function(String?) onChanged;

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.items,
    required this.onChanged,
    this.value,
  });

  @override
  State<CustomDropdownField> createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
        widget.onChanged(value);
      },

      selectedItemBuilder: (context) {
        return widget.items.map((item) {
          return Text(
            item,
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          );
        }).toList();
      },

      items: widget.items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: GoogleFonts.poppins(fontSize: 16.sp, color: Colors.black),
          ),
        );
      }).toList(),

      dropdownColor: Colors.white,
      decoration: InputDecoration(
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
      icon: Icon(Icons.arrow_drop_down, color: AppColor.primaryColor),
    );
  }
}
