import 'package:flutter/material.dart';

import 'widgets/matched_car_view_body.dart';

class MatchedCarView extends StatelessWidget {
  const MatchedCarView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MatchedCarViewBody(),
    );
  }
}
