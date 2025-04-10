import 'package:daythree/core/theme/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../assets.dart';

class DefaultTextField extends StatelessWidget {
  final String hint;
  final bool hasPrefix;

  final double radius;
  final Widget? suffix;

  DefaultTextField({
    super.key,
    required this.hint,
    this.hasPrefix = true,
    this.suffix, this.radius = 15,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: greyColor),
        fillColor: lightGrey,
        filled: true,

        suffixIcon: suffix,
        prefixIcon:
            hasPrefix
                ? Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(Assets.search),
                )
                : null,
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          borderSide: BorderSide(color: mainColor, width: 1.5),
        ),

        focusColor: Colors.white,
      ),
    );
  }
}
