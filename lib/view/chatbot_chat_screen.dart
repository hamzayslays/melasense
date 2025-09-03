import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/res/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatbotChatScreen extends StatefulWidget {
  const ChatbotChatScreen({super.key});

  @override
  State<ChatbotChatScreen> createState() => _ChatbotChatScreenState();
}

class _ChatbotChatScreenState extends State<ChatbotChatScreen> {
  final List<Map<String, dynamic>> messages = [
    {"isMe": true, "text": "What is the Treatment for Melanoma?"},
    {
      "isMe": false,
      "text":
      "Melanoma is a serious type of skin cancer that develops in the pigment-producing cells (melanocytes). It can spread quickly to other parts of the body if not detected and treated early."
    },
    {"isMe": true, "text": "⁠Is Melanoma Curable?"},
    {
      "isMe": false,
      "text":
      "When detected early, melanoma is often highly treatable because the tumor can be completely removed before it spreads to other parts of the body."
    },
    {"isMe": true, "text": "⁠Is Melanoma Curable?"},
    { 
      "isMe": false,
      "text":
      "When detected early, melanoma is often highly treatable because the tumor can be completely removed before it spreads to other parts of the body."
    },  {
      "isMe": false,
      "text":
      "When detected early, melanoma is often highly treatable because the tumor can be completely removed before it spreads to other parts of the body."
    },
    {"isMe": true, "text": "⁠Is Melanoma Curable?"},
    {
      "isMe": false,
      "text":
      "When detected early, melanoma is often highly treatable because the tumor can be completely removed before it spreads to other parts of the body."
    },  {
      "isMe": false,
      "text":
      "When detected early, melanoma is often highly treatable because the tumor can be completely removed before it spreads to other parts of the body."
    },
    {"isMe": true, "text": "⁠Is Melanoma Curable?"},
    {
      "isMe": false,
      "text":
      "When detected early, melanoma is often highly treatable because the tumor can be completely removed before it spreads to other parts of the body."
    },
  ];

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
          // Chat messages
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isMe = message["isMe"];

                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: isMe
                          ? MediaQuery.of(context).size.width * 0.9
                          : MediaQuery.of(context).size.width * 0.8,
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 6),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      decoration: BoxDecoration(
                        color: isMe ? Colors.white : Color(0xFFCFE8FF),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                        border: Border.all(
                          color: Colors.black12,
                          width: 0.6,
                        ),
                      ),
                      child: Text(
                        message["text"],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Input box
          Container(
            padding: EdgeInsets.only(left: 6.w, right: 6.w, bottom: 3.h),
            decoration: BoxDecoration(color: AppColor.whiteColor),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.3.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.sp),
                      border: Border.all(color: AppColor.blackColor),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
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
