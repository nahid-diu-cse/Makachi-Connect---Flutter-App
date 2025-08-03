import 'package:flutter/cupertino.dart';
import 'package:makachi_connect/res/components/custom_appbar.dart';
import 'package:makachi_connect/res/components/ellipsis_scaffold.dart';

class VRatingReviewView extends StatelessWidget {
  const VRatingReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return EllipsisScaffold(
      body: Column(children: [CustomAppbar(title: "Rating and Review")]),
    );
  }
}
