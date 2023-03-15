import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/map_controller.dart';
import '../utils/helper.dart';
import 'small_animal_icon_label.dart';

class MapLeopards extends StatelessWidget {
  const MapLeopards({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final animation = ref.watch(mapAnimationProvider);

        double opacity = math.max(0, 4 * (animation.value - 3 / 4));
        return Positioned(
          top: topMargin(context) + 32 + 16 + 4 + oneThird(context),
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: const Padding(
        padding: EdgeInsets.only(left: 30),
        child: SmallAnimalIconLabel(
          isVulture: false,
          showLine: false,
        ),
      ),
    );
  }
}