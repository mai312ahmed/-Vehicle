import 'package:dots_indicator/dots_indicator.dart';

import 'package:flutter/material.dart';

import '../../core/widgets/buttons.dart';
import '../../core1/cWidget.dart';
import '../../core1/utils/sizeConfig.dart';
import 'page_view.dart';

class OnBoardingBody extends StatefulWidget {
  @override
  State<OnBoardingBody> createState() => OnBoardingBodyState();
}

class OnBoardingBodyState extends State<OnBoardingBody> {
  PageController? pageController;
  initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 50, bottom: 20),
      child: CPageView(
        pageController: pageController,
      ),
    ));
  }
}
