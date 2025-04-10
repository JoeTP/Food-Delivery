import 'package:daythree/core/theme/Colors.dart';
import 'package:daythree/core/widgets/AddRemButton.dart';
import 'package:daythree/core/widgets/CText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/assets.dart';

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(15.r),
    child: Row(
      children: [
        Image.asset(Assets.spaghetti, width: 100.r, height: 100.r,fit: BoxFit.cover,),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150.w,
                      child: Expanded(
                        child: CText(
                          "Spaghetti with shrimp and basil",
                          weight: FontWeight.w700,
                          size: 16,
                          maxLine: 2,
                        ),
                      ),
                    ),
                    GestureDetector(child: Icon(Icons.clear, color: mainColor)),
                  ],
                ),
                SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CText("\$14.30", weight: FontWeight.w700, color: mainColor),
                    Row(
                      children: [
                        AddRemButton(onTap: () {}, icon: Icons.remove,buttonColor: greyColor.withValues(alpha: 0.1)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CText("2"),
                        ),
                        AddRemButton(onTap: () {}, icon: Icons.add,buttonColor: greyColor.withValues(alpha: 0.1),),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
