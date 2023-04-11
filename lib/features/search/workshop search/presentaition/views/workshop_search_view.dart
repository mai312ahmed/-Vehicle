import 'package:flutter/material.dart';

import 'widgets/workshop_search_view_body.dart';

class WorkShopSearchView extends StatelessWidget {
  const WorkShopSearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WorkShopSearchViewBody(),
    );
  }
}
