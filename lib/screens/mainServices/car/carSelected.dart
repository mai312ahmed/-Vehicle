import 'package:car_store/core/utilis/constans.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../core1/const.dart';

class CarSelected extends StatelessWidget {
  const CarSelected({
    super.key,
    required this.selected,
    required this.type,
  });

  final List selected;
  final List type;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: selected.length == 1
            ? FirebaseFirestore.instance
                .collection("cars")
                .where(type[0], isEqualTo: selected[0])
                .snapshots()
            : (selected.length == 2
                ? FirebaseFirestore.instance
                    .collection("cars")
                    .where(type[0], isEqualTo: selected[0])
                    .where(type[1], isEqualTo: selected[1])
                    .snapshots()
                : FirebaseFirestore.instance
                    .collection("cars")
                    .where(type[0], isEqualTo: selected[0])
                    .where(type[1], isEqualTo: selected[1])
                    .where(type[2], isEqualTo: selected[2])
                    .snapshots()),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          } else if (snapshot.connectionState == ConnectionState.active ||
              snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Center(child: Text('Error'));
            } else if (snapshot.hasData) {
              var items = snapshot.data!.docs;
              return Scaffold(
                body: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
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
                            "Cars",
                            style:
                                TextStyle(fontSize: 20, color: KprimaryColor),
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
                      SizedBox(
                        height: items.length.toDouble() * 400,
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            //  shrinkWrap: true,
                            itemCount: items.length,
                            itemBuilder: (context, i) {
                              return CarPices(
                                pic: items[i][carPicsList],
                                year: items[i][carYear],
                                model: items[i][carModel],
                                brand: items[i][carBrand],
                                km: items[i][carKm],
                                price: items[i][carPrice],
                                doors: items[i][carDoors] ?? "Not specified",
                                exteriorColor: items[i][carExteriorColor] ??
                                    "Not specified",
                                type: items[i][carType] ?? "Not specified",
                                transmission: items[i][carTransmission] ??
                                    "Not specified",
                                trim: items[i][carTrim] ?? "Not specified",
                                fuel: items[i][carFuelType] ?? "Not specified",
                                interiorColor: items[i][carInteriorColor] ??
                                    "Not specified",
                                descriptin:
                                    items[i][carDescriptin] ?? "No descriptin ",
                                warranty:
                                    items[i][carWarranty] ?? "No warranty ",
                                cylinder:
                                    items[i][carCylinder] ?? "Not specified",
                                comfort: items[i][comfort],
                                entertainment: items[i][entertainment],
                                exterior: items[i][exterior],
                                interior: items[i][interior],
                                safetyAndDriverAssistanceSystem: items[i]
                                    [safetyAndDriverAssistanceSystem],
                              );
                            }),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return const Scaffold(body: Center(child: Text('No car match')));
            }
          } else {
            return Scaffold(
                body:
                    Center(child: Text('State: ${snapshot.connectionState}')));
          }
        }));
  }
}

class CarPices extends StatefulWidget {
  const CarPices({
    Key? key,
    required this.model,
    required this.year,
    required this.price,
    required this.km,
    required this.trim,
    required this.type,
    required this.interiorColor,
    required this.exteriorColor,
    required this.transmission,
    required this.fuel,
    required this.doors,
    required this.pic,
    required this.brand,
    required this.cylinder,
    required this.warranty,
    required this.descriptin,
    required this.exterior,
    required this.interior,
    required this.comfort,
    required this.safetyAndDriverAssistanceSystem,
    required this.entertainment,
  }) : super(key: key);
  final String? brand;
  final String? model;
  final String? year;
  final String? price;
  final String? km;
  final String? trim;
  final String? type;
  final String? interiorColor;
  final String? exteriorColor;
  final String? transmission;
  final String? fuel;
  final String? doors;
  final String? descriptin;
  final List pic;
  final List exterior;
  final List interior;
  final List comfort;
  final List safetyAndDriverAssistanceSystem;
  final List entertainment;
  final String? cylinder;
  final String? warranty;
  @override
  State<CarPices> createState() => _PicesState();
}

class _PicesState extends State<CarPices> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 15, bottom: 15),
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
        width: double.infinity,
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  offset: Offset(7, 10),
                  spreadRadius: 0,
                  blurStyle: BlurStyle.normal,
                  blurRadius: 10)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: GestureDetector(
          onTap: () {
            // Get.to(() => Details(
            //       brand: widget.brand,
            //       comfort: widget.comfort,
            //       interiorColor: widget.interiorColor,
            //       km: widget.km,
            //       model: widget.model,
            //       pic: widget.pic,
            //       price: widget.price,
            //       interior: widget.interior,
            //       transmission: widget.transmission,
            //       type: widget.type,
            //       trim: widget.trim,
            //       doors: widget.doors,
            //       year: widget.year,
            //       warranty: widget.warranty,
            //       cylinder: widget.cylinder,
            //       safetyAndDriverAssistanceSystem:
            //           widget.safetyAndDriverAssistanceSystem,
            //       fuel: widget.fuel,
            //       exteriorColor: widget.exteriorColor,
            //       exterior: widget.exterior,
            //       entertainment: widget.entertainment,
            //       descriptin: widget.descriptin,
            //     ));
          },
          child: Column(
            children: [
              SizedBox(
                height: widget.pic.isEmpty ? 0 : 150,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.pic.length,
                  itemBuilder: (BuildContext context, index) {
                    return Row(
                      children: [
                        Image.network(
                          widget.pic[index],
                        ),
                        const SizedBox(
                          width: 2,
                        )
                      ],
                    );
                  },
                ),
              ),
              const Divider(
                color: KprimaryColor,
                thickness: 1.5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, right: 35, left: 35),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.brand!,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          Text(widget.price!,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                        ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.year!),
                          Text("${widget.km} km"),
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                children: const [
                                  Icon(Icons.car_crash_outlined),
                                  Text(" Dealer "),
                                ],
                              )),
                        ]),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
