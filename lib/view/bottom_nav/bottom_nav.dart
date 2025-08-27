import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:melasense/view/home/patient_dashboard.dart';
import 'package:melasense/view/test/test_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  // Yahan apni 4 screens banao
  final List<Widget> _pages = [
    PatientDashboard(),
    NewTestScreen(),
    LearnScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
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
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,

                onTap: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Mic button tapped")));
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

              Expanded(
                child: _buildTabItem(
                  FontAwesomeIcons.bookOpenReader,
                  "Learn",
                  2,
                ),
              ),
              Expanded(
                child: _buildTabItem(FontAwesomeIcons.gear, "Settings", 3),
              ),
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
        mainAxisSize: MainAxisSize.max,
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

class LearnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("📖 Learn Screen"));
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("⚙️ Settings Screen"));
  }
}
