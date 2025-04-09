import 'package:flutter/material.dart';

import '../theme/Colors.dart';

class ImageButton extends StatelessWidget {
  final String image;
  final String buttonText;
  final VoidCallback onPress;

  ImageButton({
    required this.onPress,
    required this.buttonText,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 60,
        child: ElevatedButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: EdgeInsets.only(left: 12, right: 24),
          ),
          child: Row(
            children: [
              Image.asset("assets/images/$image.png"),
              Spacer(),
              Text(
                buttonText,
                style: TextStyle(
                  color: blackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
