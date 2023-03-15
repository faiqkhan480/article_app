import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/map_controller.dart';
import '../controller/page_controller.dart';
import 'map_hider.dart';

class VultureImage extends StatelessWidget {
  const VultureImage({super.key});

  @override
  Widget build(BuildContext context) {
    return HookConsumer(
      builder: (context, ref, child) {
        final pageState = ref.watch(pageProvider);
        final animation = ref.watch(mapAnimationProvider);

        return Positioned(
          left:
          1.2 * MediaQuery.of(context).size.width - 0.85 * pageState.offset,
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