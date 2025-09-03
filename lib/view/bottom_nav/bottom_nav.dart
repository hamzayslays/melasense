import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:melasense/view/home/patient_dashboard.dart';
import 'package:melasense/view/test/test_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../chatbot_screen.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0; // Currently selected tab index

  // List of all screens
  final List<Widget> _pages = [
    PatientDashboard(), // 0
    NewTestScreen(),    // 1
    ChatbotScreen(),    // 2 (Mic button opens this)
    LearnScreen(),      // 3
    SettingsScreen(),   // 4
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Show selected screen

      bottomNavigationBar: BottomAppBar(
        color: AppColor.whiteColor,
        child: SizedBox(
          height: 10.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: _buildTabItem(FontAwesomeIcons.house, "Home", 0)),
              Expanded(child: _buildTabItem(FontAwesomeIcons.flask, "Test", 1)),

              // Mic button opens ChatbotScreen
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    _selectedIndex = 2; // ChatbotScreen index
                  });
                },
                child: Container(
                  height: 16.h,
                  width: 16.w,
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.mic, size: 26.sp, color: Colors.white),
                ),
              ),

              // Correct indexes for remaining tabs
              Expanded(child: _buildTabItem(FontAwesomeIcons.bookOpenReader, "Learn", 3)),
              Expanded(child: _buildTabItem(FontAwesomeIcons.gear, "Settings", 4)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.blue : Colors.black54,
            size: 20.sp,
          ),
          SizedBox(height: 1.h),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              color: isSelected ? Colors.blue : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy LearnScreen
class LearnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("📖 Learn Screen"));
  }
}

// Dummy SettingsScreen
class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("⚙️ Settings Screen"));
  }
}
