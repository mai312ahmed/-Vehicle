import 'package:car_store/core/widgets/buttons.dart';
import 'package:car_store/screens/homePage.dart';
import 'package:car_store/screens/login/login.dart';
import 'package:car_store/screens/mainServices/car/car.dart';
import 'package:car_store/screens/mainServices/spare/spare.dart';
import 'package:car_store/screens/mainServices/Workshops/workshop.dart';
import 'package:flutter/material.dart';
import '../../core1/cWidget.dart';
import '../../core1/const.dart';
import 'page_view_item.dart';

class CPageView extends StatelessWidget {
  final PageController? pageController;

  const CPageView({required this.pageController});
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PageView(
        controller: pageController,
        children: [
          Stack(
            children: [
              PageViewItem(
                  description: "You can buy and sell any car you want",
                  text: "Car",
                  image: "assets/pic/car.png"),
              Positioned(
                  bottom: 20,
                  left: 8,
                  right: 8,
                  child: GeneralButton(
                    text: "Next",
                    onTap: () {
                      pageController!.jumpToPage(1);
                    },
                  ))
            ],
          ),
          Stack(
            children: [
              PageViewItem(
                  description:
                      "You can have your car repaired at the rearest  workshop to your location",
                  text: "Fast car repair  ",
                  image: "assets/pic/work.png"),
              Positioned(
                  bottom: 20,
                  left: 8,
                  right: 8,
                  child: GeneralButton(
                    text: "Next",
                    onTap: () {
                      pageController!.jumpToPage(2);
                    },
                  ))
            ],
          ),
          Stack(
            children: [
              PageViewItem(
                  description: "Get the right spare parts immediately ",
                  text: "Spares",
                  image: "assets/pic/spare.png"),
              Positioned(
                  bottom: 20,
                  left: 8,
                  right: 8,
                  child: GeneralButton(
                    text: "Start",
                    onTap: () {
                      // Get.to(() => Login());
                    },
                  ))
            ],
          ),
        ],
      ),
      Positioned(
        left: 0,
        right: 0,
        bottom: 90,
        child: CDots(
          index: pageController!.hasClients ? pageController!.page : 0,
        ),
      ),
      Positioned(
        right: 50,
        top: 20,
        child: GestureDetector(
          onTap: () {
            // Get.to(() => Login());
          },
          child: Text(
            "Skip",
            style:
                TextStyle(fontSize: 19, color: Color.fromRGBO(0, 0, 0, 0.562)),
          ),
        ),
      ),
    ]);
  }
}
//