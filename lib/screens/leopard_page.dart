import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sy_expedition/styles.dart';

import '../controller/page_controller.dart';
import '../utils/helper.dart';

class LeopardPage extends ConsumerWidget {
  const LeopardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pageProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: topMargin(context)),
        Transform.translate(
            offset: Offset(-40 - 0.5 * state.offset, 0),
            child: RotatedBox(
              quarterTurns: 1,
              child: SizedBox(
                width: mainSquareSize(context),
                child: const FittedBox(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.cover,
                  child: Text(
                    '72',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
        ),
        const SizedBox(height: 32),
        Opacity(
          opacity: math.max(0, 1 - 4 * state.page),
          child: const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              'Travel description',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Opacity(
            opacity: math.max(0, 1 - 4 * state.page),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'The leopard is distinguished by its well-camouflaged fur, opportunistic hunting behaviour, broad diet, and strength.',
                style: TextStyle(fontSize: 13, color: lightGrey),
              ),
            )
        ),
        // const The72Text(),
        // const SizedBox(height: 32),
        // const TravelDescriptionLabel(),
        // const SizedBox(height: 32),
        // const LeopardDescription(),
      ],
    );
  }
}

class The72Text extends ConsumerWidget {
  const The72Text({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offset = ref.watch(pageProvider).offset;
    return Transform.translate(
        offset: Offset(-40 - 0.5 * offset, 0),
        child: RotatedBox(
          quarterTurns: 1,
          child: SizedBox(
            width: mainSquareSize(context),
            child: const FittedBox(
              alignment: Alignment.topCenter,
              fit: BoxFit.cover,
              child: Text(
                '72',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
    );

    // return Consumer<PageOffsetNotifier>(
    //   builder: (context, notifier, child) {
    //     return Transform.translate(
    //       offset: Offset(-40 - 0.5 * notifier.offset, 0),
    //       child: child,
    //     );
    //   },
    //   child: RotatedBox(
    //     quarterTurns: 1,
    //     child: SizedBox(
    //       width: mainSquareSize(context),
    //       child: const FittedBox(
    //         alignment: Alignment.topCenter,
    //         fit: BoxFit.cover,
    //         child: Text(
    //           '72',
    //           style: TextStyle(fontWeight: FontWeight.bold),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}

class TravelDescriptionLabel extends ConsumerWidget {
  const TravelDescriptionLabel({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(pageProvider).page;
    return Opacity(
      opacity: math.max(0, 1 - 4 * page),
      child: const Padding(
        padding: EdgeInsets.only(left: 24),
        child: Text(
          'Travel description',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
    // return Consumer<PageOffsetNotifier>(
    //   builder: (context, notifier, child) {
    //     return Opacity(
    //       opacity: math.max(0, 1 - 4 * notifier.page),
    //       child: child,
    //     );
    //   },
    //   child: const Padding(
    //     padding: EdgeInsets.only(left: 24),
    //     child: Text(
    //       'Travel description',
    //       style: TextStyle(fontSize: 18),
    //     ),
    //   ),
    // );
  }
}

class LeopardDescription extends ConsumerWidget {
  const LeopardDescription({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(pageProvider).page;
    return Opacity(
      opacity: math.max(0, 1 - 4 * page),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          'The leopard is distinguished by its well-camouflaged fur, opportunistic hunting behaviour, broad diet, and strength.',
          style: TextStyle(fontSize: 13, color: lightGrey),
        ),
      )
    );

    // return Consumer<PageOffsetNotifier>(
    //   builder: (context, notifier, child) {
    //     return Opacity(
    //       opacity: math.max(0, 1 - 4 * notifier.page),
    //       child: child,
    //     );
    //   },
    //   child: const Padding(
    //     padding: EdgeInsets.symmetric(horizontal: 24),
    //     child: Text(
    //       'The leopard is distinguished by its well-camouflaged fur, opportunistic hunting behaviour, broad diet, and strength.',
    //       style: TextStyle(fontSize: 13, color: lightGrey),
    //     ),
    //   ),
    // );
  }
}