import 'package:flutter/material.dart';

import 'widgets/spare_details_view_body.dart';

class SpareDetailsView extends StatelessWidget {
  const SpareDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SpareDetailsViewBody(),
    );
  }
}
