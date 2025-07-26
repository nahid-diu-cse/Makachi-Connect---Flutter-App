import 'package:flutter/material.dart';

import '../app_images.dart';

class EllipsisScaffold extends StatelessWidget {
  final AppBar? appBar;
  final Widget body;

  const EllipsisScaffold({super.key, this.appBar, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              AppImages.bgImage,
              fit: BoxFit
                  .cover,
            ),
          ),
          body,
        ],
      ),
    );
  }
}
