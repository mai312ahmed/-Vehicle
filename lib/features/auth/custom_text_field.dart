import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.text,
    //required this.inputType,
    required this.onChange,
    required this.maxLines,
    required this.hint,
    this.suffexIcon,
    required this.validator,
  }) : super(key: key);

  final String? text;
  //final TextInputType? inputType;
  final ValueSetter? onChange;
  final String? Function(String?)? validator;
  final int? maxLines;
  final String? hint;
  final Widget? suffexIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        //keyboardType:
        onChanged: onChange,
        validator: validator,
        maxLines: maxLines,
        decoration: InputDecoration(
            label: Text(text!),
            hintText: hint,
            suffixIcon: suffexIcon ?? const SizedBox(),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: -5)));
  }
}
