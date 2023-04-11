import 'package:car_store/core/utilis/constans.dart';
import 'package:car_store/core/widgets/buttons.dart';
import 'package:car_store/core1/cWidget.dart';
import 'package:car_store/core1/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../../signup/singup.dart';
import 'carSelected.dart';

class Cars extends StatefulWidget {
  const Cars({super.key});

  @override
  State<Cars> createState() => _CarsState();
}

class _CarsState extends State<Cars> {
  List selected = [];
  List type = [];
  String? brand;
  String? year;
  String? model;
  bool exist = false;
  bool filter = false;
  bool nEw = false;
  bool used = false;
  bool toyota = false;
  bool accent = false;
  bool corolla = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: ListView(children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 40,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    filter = !filter;
                  });
                },
                child: const Icon(
                  Icons.assignment_turned_in,
                  color: KprimaryColor,
                  size: 40,
                ),
              ),
              const Chip(text: "new"),
              const SizedBox(
                width: 5,
              ),
              const Chip(text: "used"),
              const SizedBox(
                width: 5,
              ),
              const Chip(text: "corolla"),
              const SizedBox(
                width: 5,
              ),
              const Chip(text: "accent"),
              const SizedBox(
                width: 5,
              ),
              const Chip(text: "toyota"),
              const SizedBox(
                width: 5,
              ),
            ]),
          ),
          const SizedBox(
            height: 5,
          ),
          filter == false
              ? const SizedBox()
              : Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(),
                      ),
                      child: DropdownSearch<String>(
                        items: carsBrand,
                        mode: Mode.MENU,
                        showSelectedItems: true,
                        dropdownSearchDecoration:
                            const InputDecoration(hintText: "Company"),
                        showSearchBox: true,
                        searchFieldProps:
                            const TextFieldProps(cursorColor: KprimaryColor),
                        onChanged: (value) async {
                          selected.remove(brand);
                          type.remove("brand");
                          setState(() {
                            brand = value;
                            selected.add(brand);
                            type.add("brand");
                          });
                          await FirebaseFirestore.instance
                              .collection(models)
                              .doc(brand)
                              .get()
                              .then((value) {
                            var m = value.data()![models];
                            for (int i = 0; i < m.length; i++) {
                              modelsList.add(m[i]);
                            }
                            setState(() {
                              models;
                            });
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(),
                      ),
                      child: DropdownSearch<String>(
                        items: modelsList,
                        mode: Mode.MENU,
                        showSelectedItems: true,
                        dropdownSearchDecoration:
                            const InputDecoration(hintText: "Models"),
                        showSearchBox: true,
                        searchFieldProps:
                            const TextFieldProps(cursorColor: KprimaryColor),
                        onChanged: (value) {
                          selected.remove(model);
                          type.remove("model");
                          setState(() {
                            model = value;
                            selected.add(model);
                            type.add("model");
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(),
                      ),
                      child: DropdownSearch<String>(
                        items: years,
                        mode: Mode.MENU,
                        showSelectedItems: true,
                        dropdownSearchDecoration:
                            const InputDecoration(hintText: "Year"),
                        showSearchBox: true,
                        searchFieldProps:
                            const TextFieldProps(cursorColor: KprimaryColor),
                        onChanged: (value) {
                          selected.remove(year);
                          type.remove("year");
                          setState(() {
                            year = value;
                            selected.add(year);
                            type.add("year");
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GeneralButton(
                        text: "Search",
                        onTap: () {
                          if (type.isNotEmpty) {
                            // Get.to(() => CarSelected(
                            //       selected: selected,
                            //       type: type,
                            //     ));
                          } else {
                            showloadingForError(context, "select one at least");
                          }
                        }),
                  ],
                ),
          StreamBuilder(
              stream: FirebaseFirestore.instance.collection(cars).snapshots(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.active ||
                    snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Text('Error');
                  } else if (snapshot.hasData) {
                    var items = snapshot.data!.docs;
                    return SizedBox(
                      height: items.length.toDouble() * 400,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (BuildContext, i) {
                            return const Text("*********************");
                          }),
                    );
                  } else {
                    return const Text('No car yet');
                  }
                } else {
                  return Text('State: ${snapshot.connectionState}');
                }
              }))
        ]),
      ),
    );
  }
}

class Chip extends StatefulWidget {
  const Chip({
    super.key,
    required this.text,
  });
  final String text;

  @override
  State<Chip> createState() => _ChipState();
}

class _ChipState extends State<Chip> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: KprimaryColor, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Text(
              widget.text,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(
              width: 5,
            ),
            selected == true
                ? const Icon(
                    Icons.cancel,
                    color: Colors.white,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

class Filter extends StatelessWidget {
  const Filter({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 162, 173, 179),
              border: Border.all(color: KprimaryColor, width: 1.5),
              borderRadius: BorderRadius.circular(30)),
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, color: KprimaryColor),
          ),
        ),
        const SizedBox(
          width: 5,
        )
      ],
    );
  }
}
