import 'package:car_store/core/utilis/constans.dart';
import 'package:car_store/core1/const.dart';
import 'package:car_store/screens/mainServices/Workshops/workshop.dart';
import 'package:car_store/screens/mainServices/Workshops/workshopDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SpecializedWorkshop extends StatefulWidget {
  const SpecializedWorkshop({super.key, required this.serviceType});
  final String serviceType;
  @override
  State<SpecializedWorkshop> createState() => _SpecializedWorkshopState();
}

class _SpecializedWorkshopState extends State<SpecializedWorkshop> {
  bool more = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.arrow_back,
                                color: KprimaryColor)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          " workshops ",
                          style: TextStyle(fontSize: 20, color: KprimaryColor),
                        )
                      ],
                    ),
                    const Divider(
                      color: KprimaryColor,
                      thickness: 1.5,
                      height: 3,
                      endIndent: 20,
                      indent: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      " * Recommaned",
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "  * nearest workshop",
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 16),
                        ),
                        Text(
                          "see more   ",
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 16),
                        ),
                      ],
                    ),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection(workshops)
                            .where(widget.serviceType, isEqualTo: true)
                            .snapshots(),
                        builder: ((context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.connectionState ==
                                  ConnectionState.active ||
                              snapshot.connectionState ==
                                  ConnectionState.done) {
                            if (snapshot.hasError) {
                              return const Text('Error');
                            } else if (snapshot.hasData) {
                              var items = snapshot.data!.docs;
                              if (items.isEmpty) {
                                return const Text(
                                    'No matched workshop available');
                              }
                              return SizedBox(
                                height: MediaQuery.of(context).size.width <
                                        MediaQuery.of(context).size.height
                                    ? MediaQuery.of(context).size.width - 20
                                    : MediaQuery.of(context).size.height - 20,
                                width: MediaQuery.of(context).size.width <
                                        MediaQuery.of(context).size.height
                                    ? MediaQuery.of(context).size.width * 2 / 3
                                    : MediaQuery.of(context).size.height *
                                        2 /
                                        3,
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: items.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        // Get.to(() => WorkshopDetails(
                                        //       address: items[index]
                                        //           [workshopAddress],
                                        //       airCon: items[index][
                                        //           refrigerationAndAirConditioning],
                                        //       elec: items[index][electricity],
                                        //       general: items[index]
                                        //           [generalServices],
                                        //       mecha: items[index][mechanics],
                                        //       name: items[index][workshopName],
                                        //       phone: items[index]
                                        //           [workshopPhone],
                                        //       email: items[index]
                                        //           [workshopEmail],
                                        //       pic: items[index]
                                        //               [workshopPicsList] ??
                                        //           [],
                                        //     ));
                                      },
                                      child: WorkshopPices1(
                                        name: items[index][workshopName],
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else {
                              return const Text('No workshop yet');
                            }
                          } else {
                            return Text('State: ${snapshot.connectionState}');
                          }
                        }))
                  ]),
            )));
  }
}

class WorkshopPices1 extends StatelessWidget {
  const WorkshopPices1({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;
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
                  Text(name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
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
