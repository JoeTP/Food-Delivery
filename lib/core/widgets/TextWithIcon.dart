
import 'package:flutter/cupertino.dart';

import '../theme/Colors.dart';

class TextWithIcon extends StatelessWidget {
  final IconData icon;
  final String text;

  const TextWithIcon({required this.text, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: mainColor),
        SizedBox(width: 5),
        Text(text, style: TextStyle(color: greyColor)),
      ],
    );
  }
}