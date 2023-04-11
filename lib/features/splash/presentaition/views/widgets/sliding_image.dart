import 'package:car_store/core/utilis/assets.dart';
import 'package:car_store/core/utilis/constans.dart';
import 'package:flutter/material.dart';

class SlidingImage extends StatelessWidget {
  const SlidingImage({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, _) {
        return SlideTransition(
            position: slidingAnimation,
            child: darkMode
                ? Image.asset(AssetsData.logoDark)
                : Image.asset(AssetsData.logo));
      },
      animation: slidingAnimation,
    );
  }
}
