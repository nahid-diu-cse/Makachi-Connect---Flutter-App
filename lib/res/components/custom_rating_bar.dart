import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../app_colors.dart';

class CustomRatingBar extends StatelessWidget {
  final double itemSize;
  final double rating;
  final ValueChanged<double> onRatingUpdate;  // Add onRatingUpdate as a parameter

  // Constructor to accept onRatingUpdate and other properties
  const CustomRatingBar({
    super.key,
    this.itemSize = 20,
    this.rating = 1,
    required this.onRatingUpdate,  // Mark it as required
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: itemSize,
      unratedColor: AppColors.whiteColor.withOpacity(.3),
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
      onRatingUpdate: onRatingUpdate,  // Use the passed callback
    );
  }
}
