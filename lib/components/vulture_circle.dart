import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/map_controller.dart';
import '../controller/page_controller.dart';
import '../styles.dart';


class VultureCircle extends HookConsumerWidget  {
  const VultureCircle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(pageProvider).page;
    final animation = ref.watch(mapAnimationProvider);
    double multiplier;
    if (animation.value == 0) {
      multiplier = math.max(0, 4 * page - 3);
    } else {
      multiplier = math.max(0, 1 - 6 * animation.value);
    }

    double size = MediaQuery.of(context).size.width * 0.5 * multiplier;
    return Container(
      margin: const EdgeInsets.only(bottom: 250),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: lightGrey,
      ),
      width: size,
      height: size,
    );
  }
}