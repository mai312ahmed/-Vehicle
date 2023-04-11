import 'package:car_store/core/utilis/constans.dart';
import 'package:flutter/material.dart';
import '../../../core1/const.dart';

class WorkshopDetails extends StatefulWidget {
  const WorkshopDetails({
    Key? key,
    required this.name,
    required this.address,
    this.phone,
    this.email,
    required this.pic,
    required this.elec,
    required this.general,
    required this.mecha,
    required this.airCon,
  }) : super(key: key);
  final String name;
  final String address;
  final String? phone;
  final String? email;
  final List pic;
  final bool elec;
  final bool general;
  final bool mecha;
  final bool airCon;

  @override
  State<WorkshopDetails> createState() => _DetailsState();
}

class _DetailsState extends State<WorkshopDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
                      // Get.back();
                    },
                  ),
                  Text(
                    widget.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const SizedBox()
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 15, bottom: 15),
                padding: const EdgeInsets.only(bottom: 15),
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
                      padding:
                          const EdgeInsets.only(top: 8, right: 20, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
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
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(widget.address),
                          const Text("2.3 km from your current location"),
                        ],
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
