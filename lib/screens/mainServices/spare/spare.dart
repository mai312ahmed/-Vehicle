import 'package:car_store/core/utilis/constans.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core1/cWidget.dart';
import '../../../core1/const.dart';

class Spare extends StatefulWidget {
  @override
  State<Spare> createState() => _SpareState();
}

class _SpareState extends State<Spare> {
  List<String> model = ["Toyota", "BMW", "Mercedes"];
  List<String> shaci = ["1", "2", "3"];
  List<String> year = ["2020", "2021", "2022"];
  List<String> name = ["Landcruiser", "BMW", "Bolo"];
  List<String> spare = ["i89", "g676", "k878"];
  String? sm;
  String? sy;
  String? sn;
  String? ss;
  String? sp;
  bool exist = false;
  bool l = false;
  bool r = false;
  bool b = false;
  bool f = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: ListView(children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: DropdownButtonFormField<String>(
              hint: const Text("Car name"),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.5),
                      borderSide:
                          const BorderSide(width: 2, color: KprimaryColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.5),
                      borderSide:
                          const BorderSide(width: 1, color: KprimaryColor))),
              focusColor: KprimaryColor,
              items: name
                  .map((item) =>
                      DropdownMenuItem<String>(value: item, child: Text(item)))
                  .toList(),
              onChanged: (item) {
                setState(() {
                  sn = item;
                });
              },
              value: sn,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: DropdownButtonFormField<String>(
              hint: const Text("Year"),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.5),
                      borderSide:
                          const BorderSide(width: 2, color: KprimaryColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.5),
                      borderSide:
                          const BorderSide(width: 1, color: KprimaryColor))),
              focusColor: KprimaryColor,
              items: year
                  .map((item) =>
                      DropdownMenuItem<String>(value: item, child: Text(item)))
                  .toList(),
              onChanged: (item) {
                setState(() {
                  sy = item;
                });
              },
              value: sy,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: DropdownButtonFormField<String>(
              hint: const Text("Model"),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.5),
                      borderSide:
                          const BorderSide(width: 2, color: KprimaryColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.5),
                      borderSide:
                          const BorderSide(width: 1, color: KprimaryColor))),
              focusColor: KprimaryColor,
              items: model
                  .map((item) =>
                      DropdownMenuItem<String>(value: item, child: Text(item)))
                  .toList(),
              onChanged: (item) {
                setState(() {
                  sm = item;
                });
              },
              value: sm,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: DropdownButtonFormField<String>(
              hint: const Text("Shaci NO."),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.5),
                      borderSide:
                          const BorderSide(width: 2, color: KprimaryColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.5),
                      borderSide:
                          const BorderSide(width: 1, color: KprimaryColor))),
              focusColor: KprimaryColor,
              items: shaci
                  .map((item) =>
                      DropdownMenuItem<String>(value: item, child: Text(item)))
                  .toList(),
              onChanged: (item) {
                setState(() {
                  ss = item;
                });
              },
              value: ss,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: DropdownButtonFormField<String>(
              hint: const Text("Spare NO."),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.5),
                      borderSide:
                          const BorderSide(width: 2, color: KprimaryColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.5),
                      borderSide:
                          const BorderSide(width: 1, color: KprimaryColor))),
              focusColor: KprimaryColor,
              items: spare
                  .map((item) =>
                      DropdownMenuItem<String>(value: item, child: Text(item)))
                  .toList(),
              onChanged: (item) {
                setState(() {
                  sp = item;
                });
              },
              value: sp,
            ),
          ),
          Row(
            children: [
              const Text("Right"),
              Checkbox(
                  activeColor: KprimaryColor,
                  value: r,
                  onChanged: (value) {
                    setState(() {
                      r = !r;
                      l = !r;
                    });
                  }),
              const Text("Left"),
              Checkbox(
                  activeColor: KprimaryColor,
                  value: l,
                  onChanged: (value) {
                    setState(() {
                      l = !l;
                      r = !l;
                    });
                  }),
              const Text("Front"),
              Checkbox(
                  activeColor: KprimaryColor,
                  value: f,
                  onChanged: (value) {
                    setState(() {
                      f = !f;
                      b = !f;
                    });
                  }),
              const Text("Back"),
              Checkbox(
                  activeColor: KprimaryColor,
                  value: b,
                  onChanged: (value) {
                    setState(() {
                      b = !b;
                      f = !b;
                    });
                  }),
            ],
          ),
          GeneralButton(
              text: "Search",
              onTap: () {
                setState(() {
                  exist = true;
                });
              }),
          (exist == false)
              ? const SizedBox()
              : Column(
                  children: [
                    Pices(),
                    Pices(),
                    Pices(),
                  ],
                ),
        ]),
      ),
    );
  }
}

class Pices extends StatelessWidget {
  const Pices({
    Key? key,
  }) : super(key: key);

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
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              child: PageView(children: [
                Image.asset("assets/pic/car.png"),
                Image.asset("assets/pic/car.png"),
                Image.asset("assets/pic/car.png"),
              ]),
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
                        const Text("Belt",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        const Text("BMW",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        const Text("500",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                      ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("front"),
                        const Text("left"),
                      ]),
                ],
              ),
            ),
          ],
        ));
  }
}

class Ads extends StatelessWidget {
  const Ads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 160,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: KprimaryColor,
              offset: Offset(7, 10),
              spreadRadius: 0,
              blurStyle: BlurStyle.normal,
              blurRadius: 8)
        ],
        color: Colors.white,
      ),
    );
  }
}
