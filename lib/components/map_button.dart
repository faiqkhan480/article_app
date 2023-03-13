import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/map_animation_notifier.dart';
import '../controller/page_offset_notifier.dart';

class MapButton extends StatelessWidget {
  const MapButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 8,
      bottom: 0,
      child: Consumer<PageOffsetNotifier>(
        builder: (context, notifier, child) {
          double opacity = math.max(0, 4 * notifier.page - 3);
          return Opacity(
            opacity: opacity,
            child: child,
          );
        },
        child: TextButton(
          child: const Text(
            'ON MAP',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          onPressed: () {
            final notifier = Provider.of<MapAnimationNotifier>(context, listen: false);
            notifier.value == 0
                ? notifier.forward()
            // : notifier._animationController.reverse();
                : notifier.reverse();
          },
        ),
      ),
    );
  }
}