import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatScreen extends StatefulWidget {
  final String userName;
  final String userImage;

  const ChatScreen({
    super.key,
    required this.userName,
    required this.userImage,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  // Dummy chat messages
  final List<Map<String, dynamic>> messages = [
    {
      "text": "Good bye!",
      "isMe": true,
      "time": "17:47",
      "seen": true,
      "avatar": "https://i.pravatar.cc/150?img=3",
    },
    {
      "text": "Do you know what time is it?",
      "isMe": false,
      "time": "11:40",
      "seen": false,
      "avatar": "https://i.pravatar.cc/150?img=2",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.userName,
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 17.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(2.h),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isMe = msg["isMe"];

                return Align(
                  alignment: isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: isMe
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (!isMe) ...[
                        CircleAvatar(
                          radius: 23.sp,
                          backgroundImage: NetworkImage(msg["avatar"]),
                        ),
                        SizedBox(width: 2.w),
                      ],
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 1.2.h,
                          horizontal: 2.w,
                        ),
                        margin: EdgeInsets.symmetric(vertical: 0.8.h),
                        constraints: BoxConstraints(maxWidth: 70.w),
                        decoration: BoxDecoration(
                          color: isMe
                              ? const Color(0xFFDFFFD6)
                              : const Color(0xFFD6E9FF),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14.sp),
                            topRight: Radius.circular(14.sp),
                            bottomLeft: Radius.circular(isMe ? 14.sp : 0),
                            bottomRight: Radius.circular(isMe ? 0 : 14.sp),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              msg["text"],
                              style: GoogleFonts.inter(
                                fontSize: 15.sp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 0.5.h),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  msg["time"],
                                  style: GoogleFonts.inter(
                                    fontSize: 12.sp,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                if (isMe && msg["seen"])
                                  Icon(
                                    Icons.done_all,
                                    size: 14.sp,
                                    color: Colors.blue,
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (isMe) ...[
                        SizedBox(width: 2.w),
                        CircleAvatar(
                          radius: 23.sp,
                          backgroundImage: NetworkImage(msg["avatar"]),
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),
          ),
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
                            controller: _controller,
                            decoration: InputDecoration(
                              hintText: "Message",
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
                    onPressed: () {},
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
