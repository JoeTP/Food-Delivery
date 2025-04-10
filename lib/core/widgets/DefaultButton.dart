import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/ButtonStyles.dart';
import 'CText.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double textSize;
  final DefaultButtonStyle style;
  final int flex;

  DefaultButton({
    required this.onPressed,
    required this.buttonText,
    this.flex = 1,
    this.style = DefaultButtonStyle.DEFAULT,
    super.key,
    this.textSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: SizedBox(
        height: 60,
        child: ElevatedButton(
          onPressed: onPressed,
          style: style.styles,
          child: CText(
            buttonText,
            size: textSize.sp,
            weight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
