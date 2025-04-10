import 'package:flutter/material.dart';

import '../theme/Colors.dart';

class AddRemButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color iconColor;
  final Color buttonColor;

  AddRemButton({
    required this.onTap,
    required this.icon,
    this.iconColor = blackColor,
    this.buttonColor = greyColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      child: Material(
        color: buttonColor,
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor,size: 20,),
          ),
        ),
      ),
    );
  }
}
