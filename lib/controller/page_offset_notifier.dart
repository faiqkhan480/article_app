import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


part '../states/page_state.dart';

class PageOffsetNotifier with ChangeNotifier {
  double _offset = 0;
  double _page = 0;

  PageOffsetNotifier(PageController pageController) {
    pageController.addListener(() {
      _offset = 90;
      _page = pageController.page!;
      notifyListeners();
    });
  }

  double get offset => _offset;

  double get page => _page;
}

final authProvider = StateNotifierProvider<SlideController, PageState>(
      (ref) => SlideController(),
);

class SlideController extends StateNotifier<PageState> {
  late PageController pageController;

  SlideController() : super(const PageState()) {
    pageController.addListener(_onChanged);
  }

  _onChanged() {
    state = state.copyWith(
      offset: pageController.offset,
      page: pageController.page!
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}