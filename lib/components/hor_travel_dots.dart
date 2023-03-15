import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/map_controller.dart';
import '../controller/page_controller.dart';
import '../styles.dart';
import '../utils/helper.dart';

class HorizontalTravelDots extends StatelessWidget {
  const HorizontalTravelDots({super.key});

  @override
  Widget build(BuildContext context) {
    return HookConsumer(
      builder: (context, ref, child) {
        final notifier = ref.watch(pageProvider);
        final animation = ref.watch(mapAnimationProvider);

        if (animation.value == 1) {
          return Container();
        }
        double spacingFactor;
        double opacity;
        if (animation.value == 0) {
          spacingFactor = math.max(0, 4 * notifier.page - 3);
          opacity = spacingFactor;
        } else {
          spacingFactor = math.max(0, 1 - 6 * animation.value);
          opacity = 1;
        }
        return Positioned(
          top: dotsTopMargin(context),
          left: 0,
          right: 0,
          child: Center(
            child: Opacity(
              opacity: opacity,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: spacingFactor * 10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightGrey,
                    ),
                    height: 4,
                    width: 4,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: spacingFactor * 10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightGrey,
                    ),
                    height: 4,
                    width: 4,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: spacingFactor * 40),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: white),
                    ),
                    height: 8,
                    width: 8,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: spacingFactor * 40),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: white,
                    ),
                    height: 8,
                    width: 8,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}