import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/map_controller.dart';
import '../utils/helper.dart';

class MapStartCamp extends HookConsumerWidget {
  const MapStartCamp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animation = ref.watch(mapAnimationProvider);

    double opacity = math.max(0, 4 * (animation.value - 3 / 4));

    return Positioned(
      top: startTop(context) - 4,
      width: (MediaQuery.of(context).size.width - 48) / 3,
      child: Opacity(
          opacity: opacity,
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              'Start camp',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
      ),
    );
  }
}