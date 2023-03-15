import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/map_controller.dart';
import '../utils/helper.dart';

class MapBaseCamp extends StatelessWidget {
  const MapBaseCamp({super.key});

  @override
  Widget build(BuildContext context) {
    return HookConsumer(
      builder: (context, ref, child) {
        final animation = ref.watch(mapAnimationProvider);

        double opacity = math.max(0, 4 * (animation.value - 3 / 4));
        return Positioned(
          top: topMargin(context) + 32 + 16 + 4,
          width: (MediaQuery.of(context).size.width - 48) / 3,
          right: 30.0,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Base camp',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}