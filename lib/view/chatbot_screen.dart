import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/util/routes/routes_name.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../res/colors.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        title: Text('Chat Bot ', style: TextStyle(fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 36),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient:  LinearGradient(
                      colors: [
                        Color(0xFFCFE8FF), // top
                        Color(0xFF3497F9), // middle
                        Color(0xFF287DD2), // bottom
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.5, 1.0], // 👈 exact position
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Row(
                      children:  [
                        Image.asset('assets/sparkle.png'),
                        SizedBox(width: 8),
                        Text(
                          'Hi, you can ask me anything...',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: -50,
                  top: -60,
                  // upar thoda nikalne ke liye
                  child: Image.asset(
                    'assets/chatBot.png',
                    height: 200, // bada size
                    width: 200,
                  ),
                ),
              ],
            ),
          ),

          Spacer(),
          Container(
            padding: EdgeInsets.only(left: 6.w, right: 6.w, bottom: 3.h),
            decoration: BoxDecoration(color: AppColor.whiteColor),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 0.3.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      border: Border.all(color: AppColor.blackColor),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            // controller: _controller,
                            decoration: InputDecoration(
                              hintText: "Ask Somethings",
                              border: InputBorder.none,
                              hintStyle: GoogleFonts.inter(
                                fontSize: 15.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.mic,
                          color: AppColor.primaryColor,
                          size: 20.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 2.w),
                CircleAvatar(
                  backgroundColor: AppColor.primaryColor,
                  radius: 20.sp,
                  child: IconButton(
                    icon: const Icon(Icons.send_outlined, color: Colors.white),
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.chatbotScreen);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
