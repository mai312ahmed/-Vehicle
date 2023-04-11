import 'package:car_store/core/utilis/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core1/const.dart';

class Posts extends StatefulWidget {
  @override
  State<Posts> createState() => _PostState();
}

class _PostState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Pices(),
        Pices(),
        Pices(),
        Pices(),
      ],
    );
  }
}

class Pices extends StatefulWidget {
  const Pices({
    Key? key,
  }) : super(key: key);

  @override
  State<Pices> createState() => _PicesState();
}

class _PicesState extends State<Pices> {
  @override
  Widget build(BuildContext context) {
    bool fav = false;
    late bool mai;
    return Container(
        margin: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 10),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      child: Image.asset("assets/pic/car.png"),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " Mai Ahmed",
                          style: TextStyle(
                              color: KprimaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " 20.11.2022",
                          style: TextStyle(
                            color: KprimaryColor,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Text(
                  "...",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      " look at my new car ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.purple,
                    )
                  ],
                ),
                Text(
                  "#Camry",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "#2017",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
            Container(
              height: 150,
              width: double.infinity,
              child: PageView(children: [
                Image.asset("assets/pic/camry.png"),
                Image.asset("assets/pic/camryBack.png"),
              ]),
            ),
            Divider(
              color: KprimaryColor,
              thickness: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          print("$fav");
                          setState(() {
                            fav = true;
                          });
                          print(
                              "++++++++++++++++++++++++++++++++++++++++++++++++");
                          print("$fav");
                        },
                        child: fav == false
                            ? Icon(Icons.favorite_border)
                            : Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )),
                    Icon(
                      Icons.comment,
                    ),
                    Icon(
                      Icons.send_outlined,
                    )
                  ]),
            ),
          ],
        ));
  }
}
