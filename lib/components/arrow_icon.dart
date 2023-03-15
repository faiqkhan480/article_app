import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/map_controller.dart';
import '../styles.dart';
import '../utils/helper.dart';
import 'map_hider.dart';

class ArrowIcon extends StatelessWidget {
  const ArrowIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return HookConsumer(
      builder: (context, ref, Widget? child) {
        final animation = ref.watch(mapAnimationProvider);

        return Positioned(
          top: topMargin(context) +
              (1 - animation.value) * (mainSquareSize(context) + 32 - 4),
          right: 24,
          child: child ?? const SizedBox.shrink(),
        );
      },
      child: const MapHider(
        child: Icon(
          Icons.keyboard_arrow_up,
          size: 28,
          color: lighterGrey,
        ),
      ),
    );
  }
}