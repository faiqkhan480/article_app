import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final mapAnimationProvider = ChangeNotifierProvider<MapAnimationController>((ref) {
  return MapAnimationController();
});

class MapAnimationController extends ChangeNotifier {
  final AnimationController _animationController = useAnimationController(duration: const Duration(milliseconds: 1000));

  MapAnimationController() {
    _animationController.addListener(_onAnimationControllerChanged);
  }

  void _onAnimationControllerChanged() {
    notifyListeners();
  }

  double get value => _animationController.value;

  void forward() => _animationController.forward();

  void reverse() => _animationController.reverse();

  @override
  void dispose() {
    _animationController.removeListener(_onAnimationControllerChanged);
    super.dispose();
  }
}