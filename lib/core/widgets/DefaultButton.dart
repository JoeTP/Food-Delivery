import 'package:flutter/material.dart';

import '../styles/ButtonStyles.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final DefaultButtonStyle style;
  final int flex;

  const DefaultButton({
    required this.onPressed,
    required this.buttonText,
    this.flex = 1,
    this.style = DefaultButtonStyle.DEFAULT,
    super.key,
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
          child: Text(
            buttonText,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
