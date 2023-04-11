import 'package:flutter/material.dart';

import 'widgets/add_car_view_body.dart';

class AddCarView extends StatelessWidget {
  const AddCarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: AddCarViewBody()),
    );
  }
}
