import 'package:car_store/core/utilis/constans.dart';
import 'package:car_store/screens/mainServices/Workshops/specializedworkshop.dart';
import 'package:flutter/material.dart';
import '../../../core1/cWidget.dart';
import '../../../core1/const.dart';

class WorkshopHome extends StatefulWidget {
  const WorkshopHome({super.key});

  @override
  State<WorkshopHome> createState() => _WorkshopState();
}

class _WorkshopState extends State<WorkshopHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: ListView(children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                " * hightest rated",
                style: TextStyle(color: Colors.redAccent, fontSize: 16),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width <
                        MediaQuery.of(context).size.height
                    ? MediaQuery.of(context).size.width - 45
                    : MediaQuery.of(context).size.height - 45,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    WorkshopPices(),
                    SizedBox(
                      width: 10,
                    ),
                    WorkshopPices(),
                    SizedBox(
                      width: 10,
                    ),
                    WorkshopPices(),
                  ],
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        // Get.to(() => const SpecializedWorkshop(
                        //       serviceType: mechanics,
                        //     ));
                      },
                      child: const WorkshopsServices(text: "Mechanics")),
                  GestureDetector(
                      onTap: () {
                        // Get.to(() => const SpecializedWorkshop(
                        //       serviceType: electricity,
                        //     ));
                      },
                      child: const WorkshopsServices(text: "Electricity")),
                ],
              ),
              GestureDetector(
                  onTap: () {
                    // Get.to(() => const SpecializedWorkshop(
                    //       serviceType: refrigerationAndAirConditioning,
                    //     ));
                  },
                  child: const WorkshopsServices(
                      text: "Refrigeration and Air conditioning")),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        // Get.to(() => const SpecializedWorkshop(
                        //       serviceType: generalServices,
                        //     ));
                      },
                      child: const WorkshopsServices(text: "General services")),
                ],
              ),
            ])));
  }
}

class WorkshopsServices extends StatelessWidget {
  const WorkshopsServices({super.key, this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: KprimaryColor,
                  offset: Offset(7, 10),
                  spreadRadius: 0,
                  blurStyle: BlurStyle.normal,
                  blurRadius: 10)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Text(text!, style: const TextStyle(fontSize: 20)));
  }
}

class WorkshopPices extends StatelessWidget {
  const WorkshopPices({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 15, bottom: 15),
        padding: const EdgeInsets.only(bottom: 15),
        width: MediaQuery.of(context).size.width <
                MediaQuery.of(context).size.height
            ? MediaQuery.of(context).size.width * 2 / 3
            : MediaQuery.of(context).size.height * 2 / 3,
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(5, 5),
                  spreadRadius: 0,
                  blurStyle: BlurStyle.normal,
                  blurRadius: 10)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width <
                      MediaQuery.of(context).size.height
                  ? MediaQuery.of(context).size.width / 2
                  : MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width * 2 / 3,
              child: Image.asset(
                "assets/pic/work.png",
                fit: BoxFit.fill,
              ),
            ),
            const Divider(
              color: KprimaryColor,
              thickness: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Alwaha workshop",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    children: const [
                      Icon(
                        Icons.star,
                        color: Colors.redAccent,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.redAccent,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.redAccent,
                        size: 15,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.redAccent,
                        size: 15,
                      ),
                      Icon(
                        Icons.star_border,
                        color: Colors.redAccent,
                        size: 15,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("2.3 km"),
                      ]),
                ],
              ),
            ),
          ],
        ));
  }
}
