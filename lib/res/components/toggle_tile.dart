import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ToggleTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool isDropdown; // 👈 Decide karna hai toggle ya dropdown
  final List<String>? dropdownItems;
  final String? initialValue;
  final ValueChanged<String?>? onChanged;

  const ToggleTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.isDropdown = false, // default: toggle
    this.dropdownItems,
    this.initialValue,
    this.onChanged,
  });

  @override
  State<ToggleTile> createState() => _ToggleTileState();
}

class _ToggleTileState extends State<ToggleTile> {
  bool _isOn = false;
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue ??
        (widget.dropdownItems != null && widget.dropdownItems!.isNotEmpty
            ? widget.dropdownItems!.first
            : null);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        widget.title,
        style: GoogleFonts.poppins(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        widget.subtitle,
        style: GoogleFonts.poppins(
          fontSize: 15.sp,
          color: Colors.grey[600],
        ),
      ),

      // 👇 trailing condition
      trailing: widget.isDropdown
          ? Container(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.3.h), // 👈 kam vertical padding
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isDense: true, // ye line dropdown ki height reduce karegi
            value: _selectedValue,
            items: widget.dropdownItems?.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: GoogleFonts.poppins(
                    fontSize: 15.sp, // thoda chhota font bhi height reduce karega
                    color: Colors.black,
                  ),
                ),
              );
            }).toList(),
            onChanged: (val) {
              setState(() => _selectedValue = val);
              if (widget.onChanged != null) widget.onChanged!(val);
            },
            icon: const Icon(Icons.arrow_drop_down),
          ),
        ),
      )

          : Switch(
        value: _isOn,
        onChanged: (val) {
          setState(() => _isOn = val);
        },
        activeColor: const Color(0xff6FA8DC),
        activeTrackColor: const Color(0xff6FA8DC).withOpacity(0.4),
      ),
    );
  }
}
