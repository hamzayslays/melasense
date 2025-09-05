import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../viewmodel/learn_view_model.dart';
import 'learn_screen_details.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  String? selectedCategory;
  String? selectedType;

  final List<String> allItems = const [
    "Categories", // title
    "Blog",
    "Article",
    "Documentary",
    "Type", // title
    "All",
    "Recently Viewed",
    "Bookmarks",
  ];

  // Helper to check if dropdown can be closed
  bool get canCloseDropdown => selectedCategory != null && selectedType != null;

  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<LearnViewModel>(context, listen: false);
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: const Text('Education Hub'),
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Consumer<LearnViewModel>(
          builder: (context, viewModel, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔎 Search bar + 3-dots dropdown
                Row(
                  children: [
                    // Search bar
                    SizedBox(
                      width: 80.w,
                      child: Container(
                        height: 6.5.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.w),
                          color: Colors.grey.shade200,
                        ),
                        padding: EdgeInsets.only(left: 4.w),
                        child: Row(
                          children: [
                            const Icon(Icons.search),
                            SizedBox(width: 2.w),
                            Text(
                              'Search',
                              style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 2.w),

                    // 3-dots dropdown
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        customButton: SizedBox(
                          width: 10.w,
                          child: const Icon(Icons.more_vert, color: Colors.black),
                        ),
                        value: null, // always null to allow multiple selections
                        onChanged: (_) {}, // handled inside onTap
                        items: allItems.map((item) {
                          final isCategoryTitle = item == "Categories";
                          final isTypeTitle = item == "Type";

                          if (isCategoryTitle || isTypeTitle) {
                            return DropdownMenuItem<String>(
                              value: item,
                              enabled: false,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  item,
                                  style: GoogleFonts.poppins(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            );
                          }

                          // Normal selectable item
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (allItems.indexOf(item) > 0 &&
                                        allItems.indexOf(item) < allItems.indexOf("Type")) {
                                      // Category selected
                                      selectedCategory = item;
                                    } else {
                                      // Type selected
                                      selectedType = item;
                                    }

                                    // Close dropdown only if both selected
                                    if (canCloseDropdown) {
                                      Navigator.of(context).pop();
                                    }
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item,
                                      style: GoogleFonts.poppins(
                                        fontSize: 16.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                    if ((allItems.indexOf(item) > 0 &&
                                        allItems.indexOf(item) < allItems.indexOf("Type") &&
                                        selectedCategory == item) ||
                                        (allItems.indexOf(item) > allItems.indexOf("Type") &&
                                            selectedType == item))
                                      const Icon(Icons.check, color: Colors.blue),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 40.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          offset: Offset(-25.w, 0),
                        ),
                        menuItemStyleData: const MenuItemStyleData(height: 44),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 2.h),
                Text(
                  'All',
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 1.h),

                // ListView
                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.items.length,
                    itemBuilder: (context, index) {
                      final item = viewModel.items[index];

                      return InkWell(
                        onTap: () {
                          // Navigate to DetailScreen and pass data
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailScreen(
                                image: item["image"]!,
                                title: item["title"]!,
                                subtitle: item["subtitle"]!,
                                title2: item["title2"] ?? "Understanding Early Detection",
                                description2: item["description2"] ?? "Early detection of melanoma involves identifying suspicious skin changes before the cancer has a chance to grow deeper into the skin or spread to other parts of the body. The earlier melanoma is caught, the easier it is to treat and the better the prognosis.",
                                index: index,
                              ),
                            ),
                          );
                        },
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 1.w),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              item["image"]!,
                              width: 20.w,
                              height: 20.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            item["title"]!,
                            style: GoogleFonts.poppins(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            item["subtitle"]!,
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                          trailing: InkWell(
                            onTap: () => viewModel.toggleSaved(index),
                            child: Icon(
                              viewModel.isSaved(index) ? Icons.bookmark : Icons.bookmark_border,
                              color: viewModel.isSaved(index) ? Colors.blue : Colors.grey,
                              size: 22.sp,
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
