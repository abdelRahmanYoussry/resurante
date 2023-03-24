// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatelessWidget {
  final double rate;
  final double iconSize;
  Color color = Colors.amber;
  Rating(
      {Key? key,
      required this.rate,
      this.iconSize = 16,
      this.color = Colors.amber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rate,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: color,
      ),
      itemCount: rate > 5 ? 5 : 1,
      itemSize: iconSize,
      direction: Axis.horizontal,
    );
  }
}
