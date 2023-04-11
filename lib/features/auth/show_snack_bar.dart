import 'package:car_store/core/utilis/constans.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: kprimaryColor,
      content: Text(message),
    ),
  );
}
