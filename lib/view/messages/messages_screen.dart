import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:melasense/view/messages/chat_screen.dart';
import 'package:melasense/view/widgets/chat_tile.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final List<Map<String, dynamic>> chats = [
    {
      "name": "Dr Chen Doe",
      "lastMsg": "What kind of strategy is better?",
      "image": "https://i.pravatar.cc/150?img=8",
      "time": "11/16/25",
      "seen": true,
    },
    {
      "name": "Ali Raza",
      "lastMsg": "Okay, done ✅",
      "image": "https://i.pravatar.cc/150?img=7",
      "time": "11/15/25",
      "seen": true,
    },
    {
      "name": "Sara Ahmed",
      "lastMsg": "Hello, how are you?",
      "image": "https://i.pravatar.cc/150?img=5",

      "time": "11/14/25",
      "seen": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          "Messages",
          style: GoogleFonts.inter(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ChatTile(
            name: chat["name"],
            lastMsg: chat["lastMsg"],
            imageUrl: chat["image"],
            time: chat["time"],
            seen: chat["seen"],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    userName: chat["name"],
                    userImage: chat["image"],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
