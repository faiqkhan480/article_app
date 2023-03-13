import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main_page.dart';

class LeopardImage extends StatelessWidget {
  const LeopardImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<PageOffsetNotifier, AnimationController>(
      builder: (context, notifier, animation, child) {
        return Positioned(
          left: -0.85 * notifier.offset,
          width: MediaQuery.of(context).size.width * 1.6,
          child: Transform.scale(
            alignment: const Alignment(0.6, 0),
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
          child: Image.asset('assets/leopard.png'),
        ),
      ),
    );
  }
}

class MapHider extends StatelessWidget {
  final Widget child;

  const MapHider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
    // return Consumer<MapAnimationNotifier>(
    //   builder: (context, notifier, child) {
    //     return Opacity(
    //       opacity: math.max(0, 1 - (2 * notifier.value)),
    //       child: child,
    //     );
    //   },
    //   child: child,
    // );
  }
}