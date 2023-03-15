import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/map_controller.dart';
import '../controller/page_controller.dart';
import '../utils/helper.dart';
import 'map_hider.dart';

class BaseCampLabel extends HookConsumerWidget {
  const BaseCampLabel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(pageProvider);
    final animation = ref.watch(mapAnimationProvider);
    double opacity = math.max(0, 4 * notifier.page - 3);
    return Positioned(
      top: topMargin(context) +
          32 +
          16 +
          4 +
          (1 - animation.value) * (mainSquareSize(context) + 32 - 4),
      width: (MediaQuery.of(context).size.width - 48) / 3,
      right: opacity * 24.0,
      child: Opacity(
        opacity: opacity,
        child: const MapHider(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Base camp',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}