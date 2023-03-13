import 'package:flutter/material.dart';

import '../main_page.dart';

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