import 'package:flutter/material.dart';

class LearnViewModel extends ChangeNotifier {
  List<Map<String, String>> items = [
    {
      "image": "assets/learn1.png",
      "title": "Early Detection: The key to melanoma Survival",
      "subtitle": "Sept 2024 - 9 min read",
    },
    {
      "image": "assets/learn2.png",
      "title": "What is Skin Cancer: The Anatomy",
      "subtitle": "Sept 2024 - 9 min read",
    },
    {
      "image": "assets/learn3.png",
      "title": "Early Detection: Significance of Notch1",
      "subtitle": "Sept 2024 - 9 min read",
    },
    {
      "image": "assets/learn4.png",
      "title": "The Dos and Don’ts for Melanoma Patients ",
      "subtitle": "Sept 2024 - 9 min read",
    },
    {
      "image": "assets/learn5.png",
      "title": "Early symptoms of Melanoma",
      "subtitle": "Sept 2024 - 9 min read",
    },
    {
      "image": "assets/learn6.png",
      "title": "How does Melanoma Actually look",
      "subtitle": "Sept 2024 - 9 min read",
    }
  ];

  List<bool> saved = [];

  void init() {
    saved = List.generate(items.length, (_) => false);
    notifyListeners();
  }

  void toggleSaved(int index) {
    saved[index] = !saved[index];
    notifyListeners();
  }

  bool isSaved(int index) => saved[index];
}
