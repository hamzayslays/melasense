import 'package:flutter/foundation.dart';

class OnboardingVm with ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  void setPage(int index) {
    _currentPage = index;
    notifyListeners();
  }
}
