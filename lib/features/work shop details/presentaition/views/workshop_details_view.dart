import 'package:flutter/material.dart';

import 'widgets/workshop_details_view_body.dart';

class WorkShopDetailsView extends StatelessWidget {
  const WorkShopDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WorkShopDetailsViewBody(),
    );
  }
}
