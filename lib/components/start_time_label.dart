import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/page_controller.dart';
import '../styles.dart';
import '../utils/helper.dart';
import 'map_hider.dart';

class StartTimeLabel extends StatelessWidget {
  const StartTimeLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final pageState = ref.watch(pageProvider);

        double opacity = math.max(0, 4 * pageState.page - 3);
        return Positioned(
          top: topMargin(context) + mainSquareSize(context) + 32 + 16 + 32 + 40,
          width: (MediaQuery.of(context).size.width - 48) / 3,
          left: opacity * 24.0,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: const MapHider(
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            '02:40 pm',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w300, color: lighterGrey),
          ),
        ),
      ),
    );
  }
}