import 'package:flutter/material.dart';

import 'widgets/car_details_view_body.dart';

class CarDetailsView extends StatelessWidget {
  const CarDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CarDetailsViewBody(),
    );
  }
}
