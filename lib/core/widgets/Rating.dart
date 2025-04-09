import 'package:flutter/material.dart';

import '../theme/Colors.dart';

class Rating extends StatelessWidget {
  final double rate;
  const Rating({
    required this.rate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, size: 24, color: Colors.amber),
        SizedBox(width: 4),
        Text(
          rate.toString(),
          style: TextStyle(
            color: blackColor,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
