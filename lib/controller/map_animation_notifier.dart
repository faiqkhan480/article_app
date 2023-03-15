import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// late AnimationController _mapAnimationController;

class MapAnimationNotifier with ChangeNotifier {
  final AnimationController _animationController;

  MapAnimationNotifier(this._animationController) {
    _animationController.addListener(_onAnimationControllerChanged);
  }

  double get value => _animationController.value;

  void forward() => _animationController.forward();

  void reverse() => _animationController.reverse();

  void _onAnimationControllerChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    _animationController.removeListener(_onAnimationControllerChanged);
    super.dispose();
  }
}

final mapAnimationProvider1 = StateNotifierProvider<MapController1, double>(
      (ref) => MapController1(),
);

class MapController1 extends StateNotifier<double> {
  late AnimationController _animationController;

  MapController1() : super(0) {
    _animationController.addListener(_onAnimationControllerChanged);
  }

  void forward() => _animationController.forward();

  void reverse() => _animationController.reverse();

  void _onAnimationControllerChanged() {
    state = _animationController.value;
    // notifyListeners();
  }

  @override
  void dispose() {
    _animationController.removeListener(_onAnimationControllerChanged);
    super.dispose();
  }
}