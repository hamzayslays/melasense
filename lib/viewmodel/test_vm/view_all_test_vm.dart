import 'package:flutter/material.dart';

class TestViewModel extends ChangeNotifier {
  String _selectedFilter = "7";
  String get selectedFilter => _selectedFilter;

  final List<Map<String, dynamic>> _allTests = [
    {
      "value": "2.4 ng/ml",
      "status": "Normal",
      "color": Colors.green,
      "bgColor": Color(0xFFDFFFE0),
      "date": "April 28, 2025",
      "time": "10:34 AM",
      "daysAgo": 2,
    },
    {
      "value": "3.1 ng/ml",
      "status": "Moderate",
      "color": Colors.orange,
      "bgColor": Color(0xFFFFF3E0),
      "date": "April 20, 2025",
      "time": "11:15 AM",
      "daysAgo": 15,
    },
    {
      "value": "4.0 ng/ml",
      "status": "Normal",
      "color": Colors.green,
      "bgColor": Color(0xFFDFFFE0),
      "date": "April 10, 2025",
      "time": "02:45 PM",
      "daysAgo": 25,
    },
    {
      "value": "5.0 ng/ml",
      "status": "High Risk",
      "color": Colors.red,
      "bgColor": Color(0xFFFFE0E0),
      "date": "March 10, 2025",
      "time": "09:20 AM",
      "daysAgo": 75,
    },
    {
      "value": "2.9 ng/ml",
      "status": "Normal",
      "color": Colors.green,
      "bgColor": Color(0xFFDFFFE0),
      "date": "March 25, 2025",
      "time": "07:40 AM",
      "daysAgo": 60,
    },
    {
      "value": "6.2 ng/ml",
      "status": "Moderate",
      "color": Colors.orange,
      "bgColor": Color(0xFFFFF3E0),
      "date": "February 20, 2025",
      "time": "03:30 PM",
      "daysAgo": 95,
    },
    {
      "value": "4.8 ng/ml",
      "status": "Normal",
      "color": Colors.green,
      "bgColor": Color(0xFFDFFFE0),
      "date": "April 5, 2025",
      "time": "08:50 PM",
      "daysAgo": 30,
    },
    {
      "value": "7.1 ng/ml",
      "status": "High Risk",
      "color": Colors.red,
      "bgColor": Color(0xFFFFE0E0),
      "date": "January 15, 2025",
      "time": "12:00 PM",
      "daysAgo": 130,
    },
    {
      "value": "3.6 ng/ml",
      "status": "Moderate",
      "color": Colors.orange,
      "bgColor": Color(0xFFFFF3E0),
      "date": "April 23, 2025",
      "time": "06:10 AM",
      "daysAgo": 7,
    },
    {
      "value": "2.1 ng/ml",
      "status": "Normal",
      "color": Colors.green,
      "bgColor": Color(0xFFDFFFE0),
      "date": "April 1, 2025",
      "time": "05:45 AM",
      "daysAgo": 35,
    },
  ];

  List<Map<String, dynamic>> get filteredTests {
    if (_selectedFilter == "7") {
      return _allTests.where((t) => t["daysAgo"] <= 7).toList();
    } else if (_selectedFilter == "30") {
      return _allTests.where((t) => t["daysAgo"] <= 30).toList();
    } else if (_selectedFilter == "90") {
      return _allTests.where((t) => t["daysAgo"] <= 90).toList();
    }
    return _allTests;
  }

  // test screen
  void changeFilter(String filter) {
    _selectedFilter = filter;
    notifyListeners();
  }

  int _currentStep = 0;

  int get currentStep => _currentStep;

  void setStep(int step) {
    _currentStep = step;
    notifyListeners();
  }

  void nextStep() {
    if (_currentStep < 3) {
      _currentStep++;
      notifyListeners();
    }
  }

  void resetSteps() {
    _currentStep = 0;
    notifyListeners();
  }
}
