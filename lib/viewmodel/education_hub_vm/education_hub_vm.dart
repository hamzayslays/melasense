import 'package:flutter/material.dart';

class EducationHubVM extends ChangeNotifier {
  final List<Map<String, dynamic>> _articles = [
    {
      "image": "assets/hub.png",
      "title": "Early Detection: The key to melanoma Survival",
      "date": "Sept 2024",
      "time": "9 min read",
      "bookmarked": false,
    },
    {
      "image": "assets/hub1.png",
      "title": "Early Detection and the Significance of Action",
      "date": "Sept 2024",
      "time": "9 min read",
      "bookmarked": false,
    },
    {
      "image": "assets/hub.png",
      "title": "The Dos and Don’ts for Melanoma Patients",
      "date": "Sept 2024",
      "time": "9 min read",
      "bookmarked": false,
    },
    {
      "image": "assets/hub1.png",
      "title": "Early symptoms of Melanoma",
      "date": "Sept 2024",
      "time": "9 min read",
      "bookmarked": false,
    },
    {
      "image": "assets/hub.png",
      "title": "How does Melanoma Actually look",
      "date": "Sept 2024",
      "time": "9 min read",
      "bookmarked": true,
    },
    {
      "image": "assets/hub1.png",
      "title": "What is Skin Cancer: The Anatomy",
      "date": "Sept 2024",
      "time": "9 min read",
      "bookmarked": false,
    },
  ];

  List<Map<String, dynamic>> get articles => _articles;

  void toggleBookmark(int index) {
    _articles[index]["bookmarked"] = !_articles[index]["bookmarked"];
    notifyListeners();
  }
}
