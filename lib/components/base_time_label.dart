import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/map_controller.dart';
import '../controller/page_controller.dart';
import '../styles.dart';
import '../utils/helper.dart';
import 'map_hider.dart';

class BaseTimeLabel extends StatelessWidget {
  const BaseTimeLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return HookConsumer(
      builder: (context, ref, child) {
        final pageState = ref.watch(pageProvider);
        final animation = ref.watch(mapAnimationProvider);

        double opacity = math.max(0, 4 * pageState.page - 3);
        return Positioned(
          top: topMargin(context) + 32 + 16 + 44 + (1 - animation.value) * (mainSquareSize(context) + 32 - 4),
          width: (MediaQuery.of(context).size.width - 48) / 3,
          right: opacity * 24.0,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: const MapHider(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '07:30 am',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: lighterGrey,
            ),
          ),
        ),
      ),
    );
  }
}