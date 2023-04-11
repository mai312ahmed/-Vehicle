import 'package:car_store/core/utilis/app_routers.dart';
import 'package:car_store/cubits/registraition_cubit/registraition_cubit.dart';
import 'package:car_store/features/auth/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/widgets/buttons.dart';
import '../../core1/cWidget.dart';
import '../../core1/const.dart';
import '../login/login.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

showloadingForError(BuildContext context, String msg) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("error"),
          content: Text(msg),
        );
      });
}

showloading(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
            title: Text("Please wait"), content: CircularProgressIndicator());
      });
}
