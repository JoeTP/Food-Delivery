import 'package:flutter/material.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Image.asset("assets/images/pizza.png", fit: BoxFit.cover, width: 110),
          Column(children: [

          ]),
        ],
      ),
    );
  }
}
