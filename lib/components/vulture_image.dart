import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/map_animation_notifier.dart';
import '../controller/page_offset_notifier.dart';
import '../utils/helper.dart';
import 'map_hider.dart';

class VultureImage extends StatelessWidget {
  const VultureImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<PageOffsetNotifier, AnimationController>(
      builder: (context, notifier, animation, child) {
        return Positioned(
          left:
          1.2 * MediaQuery.of(context).size.width - 0.85 * notifier.offset,
          child: Transform.scale(
            scale: 1 - 0.1 * animation.value,
            child: Opacity(
              opacity: 1 - 0.6 * animation.value,
              child: child,
            ),
          ),
        );
      },
      child: MapHider(
        child: IgnorePointer(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 90.0),
            child: Image.asset(
              'assets/vulture.png',
              height: MediaQuery.of(context).size.height / 3,
            ),
          ),
        ),
      ),
    );
  }
}