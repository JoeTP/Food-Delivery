import 'package:flutter/material.dart';

import '../theme/Colors.dart';

class Rating extends StatelessWidget {
  final double rate;
  final double? iconSize;
  final bool isUnderline;
  final bool isBold;
  final Color textColor;

  Rating({
    required this.rate,
    this.isUnderline = true,
    this.isBold = true,
    this.iconSize = 24,
    super.key,
    this.textColor = blackColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, size: iconSize, color: Colors.amber),
        SizedBox(width: 4),
        Text(
          rate.toString(),
          style: TextStyle(
            color: textColor,
            fontWeight: isBold ? FontWeight.bold : null,
            decoration: isUnderline ? TextDecoration.underline : null,
          ),
        ),
      ],
    );
  }
}
