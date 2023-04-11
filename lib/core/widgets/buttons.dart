import 'package:flutter/material.dart';

import '../../../core1/const.dart';
import '../../core1/utils/sizeConfig.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton({super.key, required this.text, required this.onTap});
  final String? text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        height: 60,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: KprimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text!,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
