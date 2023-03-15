import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/map_controller.dart';

class MapImage extends HookConsumerWidget {
  const MapImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(mapAnimationProvider).value;

    double scale = 1 + 0.3 * (1 - value);
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..scale(scale, scale)
        ..rotateZ(0.05 * math.pi * (1 - value)),
      child: Opacity(
        opacity: value,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            'assets/map-min.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
    // return Consumer<MapAnimationNotifier>(
    //   builder: (context, notifier, child) {
    //     double scale = 1 + 0.3 * (1 - value);
    //     return Transform(
    //       alignment: Alignment.center,
    //       transform: Matrix4.identity()
    //         ..scale(scale, scale)
    //         ..rotateZ(0.05 * math.pi * (1 - notifier.value)),
    //       child: Opacity(
    //         opacity: notifier.value,
    //         child: child,
    //       ),
    //     );
    //   },
    //   child: SizedBox(
    //     height: double.infinity,
    //     width: double.infinity,
    //     child: Image.asset(
    //       'assets/map-min.png',
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    // );
  }
}