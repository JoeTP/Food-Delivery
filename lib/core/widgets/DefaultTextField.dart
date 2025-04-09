import 'package:daythree/core/theme/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search dishes, restaurants",
        hintStyle: TextStyle(color: greyColor),
        fillColor: lightGrey,
        filled: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset("assets/images/search.svg",),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(color: mainColor, width: 1.5),
        ),

        focusColor: Colors.white,
      ),
    );
  }
}
