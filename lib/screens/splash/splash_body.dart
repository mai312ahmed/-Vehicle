import 'package:car_store/core/utilis/app_routers.dart';
import 'package:car_store/features/auth/singup/presentaition/views/signup_view.dart';
import 'package:car_store/screens/onBoarding/onBoarding_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core1/utils/sizeConfig.dart';

class SplasBody extends StatefulWidget {
  @override
  State<SplasBody> createState() => SplasBodyState();
}

class SplasBodyState extends State<SplasBody>
    with SingleTickerProviderStateMixin {
  AnimationController? anime;
  Animation<double>? fading;
  goToNext() {
    Future.delayed(const Duration(seconds: 4), () {
      GoRouter.of(context).pushReplacement(AppRouters.singup);
    });
  }

  @override
  void initState() {
    super.initState();
    anime =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    fading = Tween<double>(begin: .2, end: 1).animate(anime!);
    anime?.repeat(reverse: true);
    goToNext();
  }

  @override
  void dispose() {
    anime?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          FadeTransition(
            opacity: fading!,
            child: const Text("All your car needs",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
          ),
          const Spacer(
            flex: 1,
          ),
          Image.asset("assets/pic/splash.png")
        ],
      ),
    );
  }
}
