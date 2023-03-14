import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


part '../states/page_state.dart';

final pageProvider = StateNotifierProvider<SlideController, PageState>(
      (ref) => SlideController(),
);

class SlideController extends StateNotifier<PageState> {
  late PageController pageController;

  SlideController() : super(const PageState(page: 0, offset: 0)) {
    pageController.addListener(_onChanged);
  }

  _onChanged() {
    // state = state.copyWith(
    //     offset: pageController.offset,
    //     page: pageController.page!
    // );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

class PageOffNotifier extends ChangeNotifier {
  double _offset = 0;
  double _page = 0;
  final PageController _pageController = PageController();

  PageOffNotifier() {
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

// Finally, we are using ChangeNotifierProvider to allow the UI to interact with
// our TodosNotifier class.
final pProvider = ChangeNotifierProvider<PageOffNotifier>((ref) {
  return PageOffNotifier();
});