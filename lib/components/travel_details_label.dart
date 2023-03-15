import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/map_controller.dart';
import '../controller/page_controller.dart';
import '../utils/helper.dart';
import 'map_hider.dart';

class TravelDetailsLabel extends StatelessWidget {
  const TravelDetailsLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return HookConsumer(
      builder: (context, ref, child) {
        final pageState = ref.watch(pageProvider);
        final animation = ref.watch(mapAnimationProvider);

        return Positioned(
          top: topMargin(context) +
              (1 - animation.value) * (mainSquareSize(context) + 32 - 4),
          left: 24 + MediaQuery.of(context).size.width - pageState.offset,
          child: Opacity(
            opacity: math.max(0, 4 * pageState.page - 3),
            child: child,
          ),
        );
      },
      child: const MapHider(
        child: Text(
          'Travel details',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}