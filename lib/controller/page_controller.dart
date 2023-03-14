import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class PageNotifier extends ChangeNotifier {
  double _offset = 0;
  double _page = 0;
  final PageController _pageController = PageController();

  PageNotifier() {
    _pageController.addListener(() {
      _offset = pageController.offset;
      _page = _pageController.page!;
      notifyListeners();
    });
  }

  PageController get pageController => _pageController;

  double get offset => _offset;

  double get page => _page;
}

final pageProvider = ChangeNotifierProvider<PageNotifier>((ref) {
  return PageNotifier();
});