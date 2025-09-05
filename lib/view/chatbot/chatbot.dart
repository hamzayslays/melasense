import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:melasense/res/colors.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController _controller = TextEditingController();

  // dummy chat data
  List<Map<String, String>> messages = [
    {"sender": "bot", "text": "✨ Hi, you can ask me anything..."},
    {"sender": "user", "text": "What is the Treatment for Melanoma?"},
    {
      "sender": "bot",
      "text":
          "Melanoma is a serious type of skin cancer that develops in the pigment-producing cells (melanocytes). It can spread quickly to other parts of the body if not detected and treated early.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Chat Bot",
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),

      /// Chat messages
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                ListView.builder(
                  padding: EdgeInsets.all(4.w),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    final isUser = msg["sender"] == "user";

                    return Align(
                      alignment: isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        padding: EdgeInsets.all(2.h),
                        constraints: BoxConstraints(maxWidth: 75.w),
                        decoration: BoxDecoration(
                          color: isUser
                              ? Colors.white
                              : Colors.lightBlue.shade100,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16.sp),
                            bottomRight: Radius.circular(16.sp),
                            topLeft: isUser
                                ? Radius.circular(16.sp)
                                : Radius.zero,
                            topRight: isUser
                                ? Radius.zero
                                : Radius.circular(16.sp),
                          ),
                          border: isUser
                              ? Border.all(color: Colors.grey.shade300)
                              : null,
                        ),
                        child: Text(
                          msg["text"] ?? "",
                          style: GoogleFonts.inter(fontSize: 15.sp),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.sp),
                      border: Border.all(color: Colors.black54),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              hintText: "Ask Something",
                              hintStyle: GoogleFonts.inter(fontSize: 15.sp),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(Icons.mic, color: AppColor.primaryColor),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 2.w),
                GestureDetector(
                  onTap: () {
                    if (_controller.text.trim().isNotEmpty) {
                      setState(() {
                        messages.add({
                          "sender": "user",
                          "text": _controller.text.trim(),
                        });
                        _controller.clear();
                      });
                    }
                  },
                  child: CircleAvatar(
                    radius: 20.sp,
                    backgroundColor: AppColor.primaryColor,
                    child: const Icon(Icons.send, color: Colors.white),
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
