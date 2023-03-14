import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/map_controller.dart';

class MapHider extends HookConsumerWidget {
  final Widget child;

  const MapHider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(mapAnimationProvider).value;
    return Opacity(
      opacity: math.max(0, 1 - (2 * value)),
      child: child,
    );
  }
}