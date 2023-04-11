import 'package:flutter/material.dart';

import 'widgets/car_search_view_body.dart';

class CarSearchView extends StatelessWidget {
  const CarSearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CarSearchViewBody(),
    );
  }
}
