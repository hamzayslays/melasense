import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String lastMsg;
  final String imageUrl;
  final String time;
  final bool seen;
  final VoidCallback onTap;

  const ChatTile({
    super.key,
    required this.name,
    required this.lastMsg,
    required this.imageUrl,
    required this.time,
    required this.seen,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(imageUrl),
          ),
          title: Text(
            name,
            style: GoogleFonts.inter(
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          subtitle: Row(
            children: [
              if (seen) ...[
                Icon(Icons.done_all, size: 16.sp, color: Colors.blue),
                SizedBox(width: 1.w),
              ],
              Expanded(
                child: Text(
                  lastMsg,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    fontSize: 15.sp,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time,
                style: GoogleFonts.inter(fontSize: 13.sp, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ],
    );
  }
}
