import 'package:flutter/material.dart';

import 'widgets/public_wall_view_body.dart';

class PublicWallView extends StatelessWidget {
  const PublicWallView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PublicWallViewBody(),
    );
  }
}
