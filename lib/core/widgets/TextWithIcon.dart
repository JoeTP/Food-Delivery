import 'package:flutter/cupertino.dart';

import '../theme/Colors.dart';

class TextWithIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final double? textSize;
  final Color? textColor;
  final double? iconSize;
  final Color? iconColor;
  final bool isBold;

  const TextWithIcon({
    required this.text,
    required this.icon,
    super.key,
    this.textSize,
    this.textColor = greyColor,
    this.iconSize,
    this.iconColor = mainColor,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: iconSize),
        SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: textSize,
          ),
        ),
      ],
    );
  }
}
