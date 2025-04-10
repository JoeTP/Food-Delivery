import 'package:daythree/core/theme/Colors.dart';
import 'package:daythree/core/widgets/CText.dart';
import 'package:daythree/core/widgets/MyNetworkImage.dart';
import 'package:daythree/core/widgets/Rating.dart';
import 'package:daythree/core/widgets/TextWithIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/Meal.dart';

class SpecialOfferCard extends StatelessWidget {
  final Meal meal;

  const SpecialOfferCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: greenColor,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
            child: MyNetworkImage(meal.strMealThumb ?? ""),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Rating(
                    isUnderline: false,
                    rate: 4.5,
                    iconSize: 16,
                    isBold: false,
                    textColor: Colors.white54,
                  ),
                  CText(
                    meal.strMeal ?? "",
                    weight: FontWeight.w600,
                    size: 16,
                    maxLine: 1,
                    color: Colors.white,
                  ),
                  TextWithIcon(
                    text: "Free Delivery",
                    textSize: 12,
                    iconSize: 18,
                    isBold: true,
                    icon: Icons.local_shipping_outlined,
                    iconColor: Colors.white54,
                    textColor: Colors.white54,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 80,
                          height: 28,
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: CText(
                              "Buy Now",
                              color: Colors.white,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      CText(
                        "\$22.00",
                        color: Colors.white,
                        weight: FontWeight.bold,
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
}
