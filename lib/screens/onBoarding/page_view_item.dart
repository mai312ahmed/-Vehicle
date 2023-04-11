import 'package:flutter/material.dart';

import '../../core1/cWidget.dart';
import '../../core1/utils/sizeConfig.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {required this.description, required this.text, required this.image});
  final String? text;
  final String? description;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(height: 350, child: Image.asset(image!)),
      Text(
        text!,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xff2f2e41),
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Text(
            description!,
            style: TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 100, 100, 100),
            ),
          ),
        ),
      ),
    ]);
  }
}
