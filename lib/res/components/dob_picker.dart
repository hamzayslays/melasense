import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDateField extends StatefulWidget {
  final String? label;
  final DateTime? value;
  final void Function(DateTime?) onChanged;

  const CustomDateField({
    super.key,
     this.label,
    this.value,
    required this.onChanged,
  });

  @override
  State<CustomDateField> createState() => _CustomDateFieldState();
}

class _CustomDateFieldState extends State<CustomDateField> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.value;
  }

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
      widget.onChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pickDate,
      child: InputDecorator(
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
          suffixIcon: Icon(Icons.date_range_rounded, ),
        ),
        child: Text(
          selectedDate != null
              ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
              : "D.O.B",
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            color: selectedDate != null ? Colors.black : Colors.grey,
          ),
        ),
      ),
    );
  }
}
