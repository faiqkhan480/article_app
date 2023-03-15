import 'package:flutter/material.dart';

import 'wrapper.dart';
import 'styles.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: mainBlack,
      ),
      home: const MainPage(),
    );
  }
}
