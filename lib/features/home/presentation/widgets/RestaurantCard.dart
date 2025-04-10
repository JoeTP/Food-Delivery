import 'package:daythree/core/theme/Colors.dart';
import 'package:daythree/core/widgets/CText.dart';
import 'package:daythree/core/widgets/Rating.dart';
import 'package:daythree/core/widgets/TextWithIcon.dart';
import 'package:flutter/material.dart';


class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: blackColor.withValues(alpha: 0.1), blurRadius:
            10,spreadRadius: -1),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  "assets/image/restaurant.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CText(
                        "Seafood",
                        color: blackColor,
                        weight: FontWeight.w600,
                        size: 15,
                      ),
                      Rating(
                        rate: 4.2,
                        iconSize: 20,
                        isUnderline: false,
                        isBold: false,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      TextWithIcon(
                        text: "Free Delivery",
                        icon: Icons.local_shipping_outlined,
                        iconSize: 18,
                      ),
                      SizedBox(width: 20),
                      TextWithIcon(
                        text: "45 mins",
                        icon: Icons.timer,
                        iconSize: 18,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
