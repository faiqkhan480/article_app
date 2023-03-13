import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sy_expedition/styles.dart';

import '../components/map_hider.dart';
import '../controller/page_offset_notifier.dart';
import '../utils/helper.dart';

class LeopardPage extends StatelessWidget {
  const LeopardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: topMargin(context)),
        const The72Text(),
        const SizedBox(height: 32),
        const TravelDescriptionLabel(),
        const SizedBox(height: 32),
        const LeopardDescription(),
      ],
    );
  }
}

class The72Text extends StatelessWidget {
  const The72Text({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Transform.translate(
          offset: Offset(-40 - 0.5 * notifier.offset, 0),
          child: child,
        );
      },
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
      ),
    );
  }
}

class TravelDescriptionLabel extends StatelessWidget {
  const TravelDescriptionLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Opacity(
          opacity: math.max(0, 1 - 4 * notifier.page),
          child: child,
        );
      },
      child: const Padding(
        padding: EdgeInsets.only(left: 24),
        child: Text(
          'Travel description',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class LeopardDescription extends StatelessWidget {
  const LeopardDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Opacity(
          opacity: math.max(0, 1 - 4 * notifier.page),
          child: child,
        );
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          'The leopard is distinguished by its well-camouflaged fur, opportunistic hunting behaviour, broad diet, and strength.',
          style: TextStyle(fontSize: 13, color: lightGrey),
        ),
      ),
    );
  }
}