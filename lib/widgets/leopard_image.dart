import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/map_hider.dart';
import '../controller/map_controller.dart';
import '../controller/page_controller.dart';


class LeopardImage extends StatelessWidget {
  const LeopardImage({super.key});

  @override
  Widget build(BuildContext context) {
    return HookConsumer(
      builder: (context, ref, child) {
        final pageState = ref.watch(pageProvider);
        final animation = ref.watch(mapAnimationProvider);

        return Positioned(
          left: -0.85 * pageState.offset,
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