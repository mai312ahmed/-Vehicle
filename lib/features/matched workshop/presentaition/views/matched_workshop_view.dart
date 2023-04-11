import 'package:flutter/material.dart';

import 'widgets/matched_workshop_view_body.dart';

class MatchedWorkShopView extends StatelessWidget {
  const MatchedWorkShopView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MatchedWorkShopViewBody(),
    );
  }
}
