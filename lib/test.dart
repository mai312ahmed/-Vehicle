import 'package:car_store/core1/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GestureDetector(
        onTap: () async {
          await FirebaseFirestore.instance
              .collection(models)
              .doc("ACURA")
              .update({
            models: [
              "CL",
              "CSX",
              "ELILX",
              "INTEGRA",
              "MDX",
              "NSX",
              "RDX",
              "RL",
              "RLX",
              "RSX",
              "SLX",
              "TL",
              "TLX",
              "TSX",
              "ZDX",
            ]
          });
        },
        child: const Text(
          "check",
          style: TextStyle(fontSize: 50),
        ),
      )),
    );
  }
}
