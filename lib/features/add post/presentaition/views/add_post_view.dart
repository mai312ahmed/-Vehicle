import 'package:flutter/material.dart';

import 'widgets/add_post_view_body.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AddPostViewBody(),
    );
  }
}
