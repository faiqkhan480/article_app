import 'package:flutter/material.dart';

import '../components/map_hider.dart';
import '../components/vulture_circle.dart';

class VulturePage extends StatelessWidget {
  const VulturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MapHider(
        child: VultureCircle(),
      ),
    );
  }
}