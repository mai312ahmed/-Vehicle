import 'package:car_store/core/utilis/constans.dart';
import 'package:car_store/core1/const.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({
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
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
                onPressed: () {
                  //Get.back();
                },
              ),
              Text(
                widget.brand!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox()
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              Pices(
                km: widget.km,
                model: widget.model,
                year: widget.year,
                price: widget.price,
                pic: widget.pic,
              ),
              Charac(
                year: widget.year,
                brand: widget.brand,
                trim: widget.trim,
                warranty: widget.warranty,
                type: widget.type,
                transmission: widget.transmission,
                model: widget.model,
                km: widget.km,
                interiorColor: widget.interiorColor,
                fuel: widget.fuel,
                exteriorColor: widget.exteriorColor,
                cylinder: widget.cylinder,
                doors: widget.doors,
              ),
              Features(
                comfortList: widget.comfort,
                entertainmentList: widget.entertainment,
                exteriorList: widget.exterior,
                interiorList: widget.interior,
                safetyAndDriverAssistanceSystemList:
                    widget.safetyAndDriverAssistanceSystem,
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: const Color.fromRGBO(181, 212, 236, 1),
          child: Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(15),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  "Text me",
                  style: TextStyle(fontSize: 23, color: KprimaryColor),
                ),
                Icon(
                  Icons.message,
                  color: KprimaryColor,
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}

class Pices extends StatelessWidget {
  const Pices({
    Key? key,
    required this.model,
    required this.year,
    required this.price,
    required this.km,
    required this.pic,
  }) : super(key: key);
  final String? model;
  final String? year;
  final String? price;
  final String? km;
  final List pic;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 15, bottom: 10),
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
        width: double.infinity,
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
              height: pic.isEmpty ? 0 : 150,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: pic.length,
                itemBuilder: (BuildContext context, index) {
                  return Row(
                    children: [
                      Image.network(
                        pic[index],
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
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, right: 35, left: 35),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(model!,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        Text(price!,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                      ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(year!),
                        Text("$km km"),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
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
        ));
  }
}

class Charac extends StatefulWidget {
  const Charac(
      {super.key,
      required this.brand,
      required this.model,
      required this.year,
      required this.km,
      required this.trim,
      required this.type,
      required this.interiorColor,
      required this.exteriorColor,
      required this.transmission,
      required this.fuel,
      required this.doors,
      required this.cylinder,
      required this.warranty});
  final String? brand;
  final String? model;
  final String? year;
  final String? km;
  final String? trim;
  final String? type;
  final String? interiorColor;
  final String? exteriorColor;
  final String? transmission;
  final String? fuel;
  final String? doors;
  final String? cylinder;
  final String? warranty;

  @override
  State<Charac> createState() => _CharacState();
}

class _CharacState extends State<Charac> {
  bool more = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5),
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
        width: double.infinity,
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
            const Text(
              "Car specification ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: KprimaryColor),
            ),
            const SizedBox(
              height: 10,
            ),
            SFeature(
              text1: carBrand,
              text2: widget.brand!,
            ),
            const SizedBox(
              height: 10,
            ),
            SFeature(
              text1: carModel,
              text2: widget.model!,
            ),
            const SizedBox(
              height: 10,
            ),
            SFeature(
              text1: carYear,
              text2: widget.year!,
            ),
            const SizedBox(
              height: 10,
            ),
            SFeature(
              text1: carKm,
              text2: widget.km!,
            ),
            const SizedBox(
              height: 10,
            ),
            more == false
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        more = !more;
                      });
                    },
                    child: Container(
                      child: const Text("view all specification"),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all()),
                    ),
                  )
                : Column(
                    children: [
                      SFeature(
                        text1: carTrim,
                        text2: widget.trim!,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SFeature(
                        text1: carType,
                        text2: widget.type!,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SFeature(
                        text1: carInteriorColor,
                        text2: widget.interiorColor!,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SFeature(
                        text1: carExteriorColor,
                        text2: widget.exteriorColor!,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SFeature(
                        text1: carTransmission,
                        text2: widget.transmission!,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SFeature(
                        text1: carFuelType,
                        text2: widget.fuel!,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SFeature(
                        text1: carDoors,
                        text2: widget.doors!,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SFeature(
                        text1: carCylinder,
                        text2: widget.cylinder!,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SFeature(
                        text1: carWarranty,
                        text2: widget.warranty!,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            more = !more;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all()),
                          child: const Text("view less specification"),
                        ),
                      )
                    ],
                  )
          ],
        ));
  }
}

class SFeature extends StatelessWidget {
  const SFeature({
    super.key,
    required this.text1,
    required this.text2,
  });

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text1),
        Text(text2),
      ],
    );
  }
}

class Features extends StatefulWidget {
  Features(
      {super.key,
      required this.interiorList,
      required this.exteriorList,
      required this.comfortList,
      required this.safetyAndDriverAssistanceSystemList,
      required this.entertainmentList});

  final List interiorList;
  final List exteriorList;
  final List comfortList;
  final List safetyAndDriverAssistanceSystemList;
  final List entertainmentList;

  @override
  State<Features> createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 15, bottom: 10),
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
        width: double.infinity,
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
            const Text(
              "Car features",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: KprimaryColor),
            ),
            Dfeature(
                list: widget.safetyAndDriverAssistanceSystemList,
                lable: safetyAndDriverAssistanceSystem),
            Dfeature(list: widget.interiorList, lable: interior),
            Dfeature(list: widget.exteriorList, lable: exterior),
            Dfeature(list: widget.entertainmentList, lable: entertainment),
            Dfeature(list: widget.comfortList, lable: comfort)
          ],
        ));
  }
}

class WhyThisCar extends StatelessWidget {
  const WhyThisCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 15, bottom: 10),
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
        width: double.infinity,
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
          children: [],
        ));
  }
}

class Dfeature extends StatefulWidget {
  const Dfeature({super.key, required this.list, required this.lable});
  final List list;
  final String lable;

  @override
  State<Dfeature> createState() => _DfeatureState();
}

class _DfeatureState extends State<Dfeature> {
  bool feature = false;

  @override
  Widget build(BuildContext context) {
    return widget.list.isEmpty
        ? const SizedBox()
        : Column(
            children: [
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    feature = !feature;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 5,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(3)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.lable,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const Icon(
                        Icons.arrow_drop_down,
                        size: 35,
                      )
                    ],
                  ),
                ),
              ),
              feature == false
                  ? const SizedBox()
                  : SizedBox(
                      height: widget.list.length * 29,
                      child: ListView.builder(
                          itemCount: widget.list.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                top: 8,
                              ),
                              child: Text(
                                widget.list[index],
                                style: const TextStyle(fontSize: 18),
                              ),
                            );
                          }),
                    )
            ],
          );
  }
}
