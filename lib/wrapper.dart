import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'common_libs.dart';
// import 'controller/map_animation_notifier.dart';
// import 'controller/page_offset_notifier.dart';
import 'controller/page_controller.dart';
import 'screens/leopard_page.dart';
import 'screens/vulture_page.dart';
import 'utils/helper.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(pageProvider);
    mediaPadding = MediaQuery.of(context).padding;
    return Scaffold(
      body: Consumer(
          builder: (context, ref, child) {
            final page = ref.watch(pageProvider);
            return PageView(
              controller: page.pageController,
              physics: const ClampingScrollPhysics(),
              children: const <Widget>[
                LeopardPage(),
                VulturePage(),
              ],
            );
          }
      ),
      // body: PageView(
      //   controller: page.pageController,
      //   physics: const ClampingScrollPhysics(),
      //   children: <Widget>[
      //     LeopardPage(),
      //     Container(color: Colors.green),
      //     // VulturePage(),
      //   ],
      // ),
    );
  }
}



// class Wrapper extends StatefulWidget {
//   const Wrapper({Key? key}) : super(key: key);
//
//   @override
//   State<Wrapper> createState() => _WrapperState();
// }
//
// class _WrapperState extends State<Wrapper> with TickerProviderStateMixin {
//   late AnimationController _animationController;
//   late AnimationController _mapAnimationController;
//   final PageController _pageController = PageController();
//
//   double get maxHeight => mainSquareSize(context) + 32 + 24;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1000),
//     );
//     _mapAnimationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1000),
//     );
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     _mapAnimationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     mediaPadding = MediaQuery.of(context).padding;
//     return ChangeNotifierProvider(
//       // builder: (_) => PageOffsetNotifier(_pageController),
//       create: (BuildContext context) => PageOffsetNotifier(_pageController),
//       child: ListenableProvider.value(
//         value: _animationController,
//         child: ChangeNotifierProvider(
//           // builder: (_) => MapAnimationNotifier(_mapAnimationController),
//           create: (context) => MapAnimationNotifier(_mapAnimationController),
//           child: Scaffold(
//             body: Stack(
//               children: <Widget>[
//                 const MapImage(),
//                 SafeArea(
//                   child: GestureDetector(
//                     onVerticalDragUpdate: _handleDragUpdate,
//                     onVerticalDragEnd: _handleDragEnd,
//                     child: Stack(
//                       alignment: Alignment.center,
//                       children: <Widget>[
//                         PageView(
//                           controller: _pageController,
//                           physics: const ClampingScrollPhysics(),
//                           children: const <Widget>[
//                             LeopardPage(),
//                             VulturePage(),
//                           ],
//                         ),
//                         // const PageHeader(),
//                         // const LeopardImage(),
//                         // const VultureImage(),
//                         // const ShareButton(),
//                         // const PageIndicator(),
//                         // const ArrowIcon(),
//                         // const TravelDetailsLabel(),
//                         // const StartCampLabel(),
//                         // const StartTimeLabel(),
//                         // const BaseCampLabel(),
//                         // const BaseTimeLabel(),
//                         // const DistanceLabel(),
//                         // const HorizontalTravelDots(),
//                         // const MapButton(),
//                         // const VerticalTravelDots(),
//                         // const VultureIconLabel(),
//                         // const LeopardIconLabel(),
//                         // const CurvedRoute(),
//                         // const MapBaseCamp(),
//                         // const MapLeopards(),
//                         // const MapVultures(),
//                         // const MapStartCamp(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _handleDragUpdate(DragUpdateDetails details) {
//     _animationController.value -= details.primaryDelta! / maxHeight;
//   }
//
//   void _handleDragEnd(DragEndDetails details) {
//     if (_animationController.isAnimating || _animationController.status == AnimationStatus.completed) return;
//
//     final double flingVelocity = details.velocity.pixelsPerSecond.dy / maxHeight;
//
//     if (flingVelocity < 0.0) {
//       _animationController.fling(velocity: math.max(2.0, -flingVelocity));
//     } else if (flingVelocity > 0.0) {
//       _animationController.fling(velocity: math.min(-2.0, -flingVelocity));
//     } else {
//       _animationController.fling(
//           velocity: _animationController.value < 0.5 ? -2.0 : 2.0);
//     }
//   }
// }