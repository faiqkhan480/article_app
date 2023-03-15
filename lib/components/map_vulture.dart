import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/map_controller.dart';
import '../utils/helper.dart';
import 'small_animal_icon_label.dart';

class MapVultures extends StatelessWidget {
  const MapVultures({super.key});

  @override
  Widget build(BuildContext context) {
    return HookConsumer(
      builder: (context, ref, child) {
        final animation = ref.watch(mapAnimationProvider);

        double opacity = math.max(0, 4 * (animation.value - 3 / 4));
        return Positioned(
          top: topMargin(context) + 32 + 16 + 4 + 2 * oneThird(context),
          right: 50,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: const SmallAnimalIconLabel(
        isVulture: true,
        showLine: false,
      ),
    );
  }
}