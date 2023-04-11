import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '../../core1/const.dart';
import 'utils/sizeConfig.dart';

class VSpace extends StatelessWidget {
  const VSpace(this.height, {super.key});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 2,
    );
  }
}

class HSpace extends StatelessWidget {
  const HSpace({super.key, required this.width});
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: SizeConfig.defaultSize! * width!);
  }
}

class CDots extends StatelessWidget {
  const CDots({super.key, required this.index});
  final double? index;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
        dotsCount: 3,
        position: index!,
        decorator: DotsDecorator(
          activeColor: KprimaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: KprimaryColor)),
        ));
  }
}
