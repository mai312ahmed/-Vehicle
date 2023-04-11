import 'package:car_store/core/utilis/constans.dart';
import 'package:car_store/core1/const.dart';
import 'package:flutter/material.dart';

import 'widgets/Splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? KprimaryColor : kprimaryBackgroundColor,
      body: const SplashViewBody(),
    );
  }
}
