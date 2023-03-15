import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/page_controller.dart';
import '../styles.dart';
import '../utils/helper.dart';
import 'map_hider.dart';

class DistanceLabel extends StatelessWidget {
  const DistanceLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final pageState = ref.watch(pageProvider);

        double opacity = math.max(0, 4 * pageState.page - 3);
        return Positioned(
          top: topMargin(context) + mainSquareSize(context) + 32 + 16 + 32 + 40,
          width: MediaQuery.of(context).size.width,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: const MapHider(
        child: Center(
          child: Text(
            '72 km',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: white,
            ),
          ),
        ),
      ),
    );
  }
}