import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleViewModel extends ChangeNotifier {
  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;

  void setDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  String get formattedDate {
    if (_selectedDate == null) return "";
    return DateFormat("MMMM d").format(_selectedDate!);
  }

  // book appointment read more/less functionality
  bool isExpanded = false;

  void toggle() {
    isExpanded = !isExpanded;
    notifyListeners();
  }

  // week row
  DateTime currentDate = DateTime.now();
  void setCurrentDate(DateTime date) {
    currentDate = date;
    notifyListeners();
  }

  String? _selectedTime;
  String? get selectedTime => _selectedTime;

  void selectTime(String time) {
    _selectedTime = time;
    notifyListeners();
  }
}
