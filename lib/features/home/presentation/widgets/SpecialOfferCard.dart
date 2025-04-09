import 'package:daythree/core/theme/Colors.dart';
import 'package:daythree/core/widgets/CText.dart';
import 'package:daythree/core/widgets/Rating.dart';
import 'package:daythree/core/widgets/TextWithIcon.dart';
import 'package:flutter/material.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: greenColor,
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/burger.png",
            fit: BoxFit.cover,
            width: 125,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15.0, 15.0, 15.0),
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
                    "Burger King",
                    weight: FontWeight.w600,
                    size: 16,
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
