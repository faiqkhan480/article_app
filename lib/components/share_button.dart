import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      right: 24,
      bottom: 16,
      child: Icon(Icons.share),
    );
  }
}