import 'package:car_store/core/utilis/constans.dart';
import 'package:car_store/main.dart';
import 'package:car_store/screens/mainServices/Workshops/workshop.dart';
import 'package:car_store/screens/mainServices/car/car.dart';
import 'package:car_store/screens/mainServices/spare/spare.dart';
import 'package:car_store/screens/myProfile/me.dart';
import 'package:car_store/screens/signup/singup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../core/widgets/buttons.dart';
import '../core1/cWidget.dart';
import '../core1/const.dart';
import 'login/login.dart';
import 'post.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController? pageController;
  initState() {
    pageController = PageController(initialPage: 2)
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: KprimaryColor,
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.access_alarm),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return Login();
                }));
              },
            ),
          ),
        ),
        appBar: AppBar(
          actions: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications,
                size: 30,
              ),
            )
          ],
          shadowColor: KprimaryColor,
          backgroundColor: KprimaryColor,
          title: const Text(
            "Vehicles",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: PageView(
              controller: pageController,
              children: [
                const Me(),
                const WorkshopHome(),
                const Cars(),
                Spare(),
                Posts()
              ],
            )),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageController!.jumpToPage(0);
                  });
                },
                child: const M1(
                  text: "me",
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageController!.jumpToPage(1);
                  });
                },
                child: const M1(
                  text: "worksho",
                  icon: Icon(Icons.work, color: Colors.white),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageController!.jumpToPage(2);
                  });
                },
                child: const M1(
                  text: "cars",
                  icon: Icon(Icons.car_crash, color: Colors.white),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageController!.jumpToPage(3);
                  });
                },
                child: const M1(
                  text: "spares",
                  icon: Icon(Icons.car_repair, color: Colors.white),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageController!.jumpToPage(4);
                  });
                },
                child: const M1(
                  text: "videoes",
                  icon: Icon(Icons.remove_red_eye, color: Colors.white),
                ),
              ),
            ])
          ],
        ));
  }
}

class M1 extends StatelessWidget {
  const M1({required this.text, required this.icon});
  final String? text;
  final Icon? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: KprimaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Column(
        children: [
          icon!,
          Text(
            text!,
            style: const TextStyle(fontSize: 15, color: Colors.white),
          ),
        ],
      ),
      width: ((MediaQuery.of(context).size.width) - 4) / 5,
    );
  }
}
