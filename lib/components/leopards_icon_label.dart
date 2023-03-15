import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import '../controller/map_controller.dart';
import '../utils/helper.dart';
import 'small_animal_icon_label.dart';

class LeopardIconLabel extends StatelessWidget {
  const LeopardIconLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return HookConsumer(
      builder: (context, ref, child) {
        final animation = ref.watch(mapAnimationProvider);
        final notifier = useAnimationController(duration: const Duration(milliseconds: 1000));

        double opacity;
        if (animation.value < 3 / 4) {
          opacity = 0;
        } else if (notifier.value == 0) {
          opacity = 4 * (animation.value - 3 / 4);
        } else if (notifier.value < 0.33) {
          opacity = 1 - 3 * notifier.value;
        } else {
          opacity = 0;
        }
        return Positioned(
          top: endTop(context) + oneThird(context) - 28 - 16 - 7,
          left: 10 + opacity * 16,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: const SmallAnimalIconLabel(
        isVulture: false,
        showLine: true,
      ),
    );
  }
}