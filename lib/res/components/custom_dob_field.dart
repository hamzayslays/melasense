import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:melasense/res/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDOBField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String dateFormat; // e.g., 'dd/MM/yyyy'
  final String? Function(String?)? validator;
  final void Function(DateTime)? onDateSelected;
  final int? minAge; // optional age validation (in years)
  final int? maxAge; // optional age validation (in years)

  const CustomDOBField({
    super.key,
    required this.controller,
    this.label = 'Date of Birth',
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.dateFormat = 'dd/MM/yyyy',
    this.validator,
    this.onDateSelected,
    this.minAge,
    this.maxAge,
  });

  @override
  State<CustomDOBField> createState() => _CustomDOBFieldState();
}

class _CustomDOBFieldState extends State<CustomDOBField> {
  Future<void> _pickDate() async {
    final now = DateTime.now();
    final initial =
        widget.initialDate ??
        (widget.controller.text.isNotEmpty
            ? _tryParse(widget.controller.text, widget.dateFormat) ?? now
            : DateTime(now.year - 18, now.month, now.day));
    final first = widget.firstDate ?? DateTime(1900, 1, 1);
    final last = widget.lastDate ?? now;

    final picked = await showDatePicker(
      context: context,
      initialDate: initial.isBefore(first) || initial.isAfter(last)
          ? last
          : initial,
      firstDate: first,
      lastDate: last,
      helpText: widget.label,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(
              context,
            ).colorScheme.copyWith(primary: AppColor.primaryColor),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      final formatted = DateFormat(widget.dateFormat).format(picked);
      widget.controller.text = formatted;
      if (widget.onDateSelected != null) widget.onDateSelected!(picked);
      setState(() {});
    }
  }

  static DateTime? _tryParse(String input, String fmt) {
    try {
      return DateFormat(fmt).parseStrict(input);
    } catch (_) {
      return null;
    }
  }

  String? _runValidation(String? value) {
    // custom validator first (if provided)
    final customError = widget.validator?.call(value);
    if (customError != null) return customError;

    if (value == null || value.trim().isEmpty) {
      return 'Please select your date of birth';
    }

    final date = _tryParse(value.trim(), widget.dateFormat);
    if (date == null) return 'Invalid date format';

    final now = DateTime.now();
    if (date.isAfter(now)) return 'DOB cannot be in the future';

    // Age checks if provided
    int age = now.year - date.year;
    final hadBirthdayThisYear =
        (now.month > date.month) ||
        (now.month == date.month && now.day >= date.day);
    if (!hadBirthdayThisYear) age--;

    if (widget.minAge != null && age < widget.minAge!) {
      return 'Minimum age is ${widget.minAge} years';
    }
    if (widget.maxAge != null && age > widget.maxAge!) {
      return 'Maximum age is ${widget.maxAge} years';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      readOnly: true,
      onTap: _pickDate,
      validator: _runValidation,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: _pickDate,
          child: const Icon(Icons.calendar_month, color: AppColor.primaryColor),
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
