import 'package:flutter/material.dart';

import '../theme/Colors.dart';

class MyBackButton extends StatelessWidget {
  final IconData? icon;
  final double? iconSize;
  double rightPadding;

  MyBackButton({
    this.icon = Icons.arrow_back_ios,
    this.iconSize = 16,
    this.rightPadding = 0,
    super.key,
  });

  var size = 40.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        width: size,
        height: size,
        padding: EdgeInsets.only(left: 5, right: rightPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: blackColor.withValues(alpha: 0.1), blurRadius: 8),
          ],
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Center(child: Icon(icon, size: iconSize)),
      ),
    );
  }
}
