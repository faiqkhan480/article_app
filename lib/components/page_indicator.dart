import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/page_controller.dart';
import '../styles.dart';
import 'map_hider.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return MapHider(
      child: Consumer(
        builder: (context, ref, child) {
          final pageState = ref.watch(pageProvider);
          return Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: pageState.page.round() == 0 ? white : lightGrey,
                    ),
                    height: 6,
                    width: 6,
                  ),
                  const SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: pageState.page.round() != 0 ? white : lightGrey,
                    ),
                    height: 6,
                    width: 6,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
