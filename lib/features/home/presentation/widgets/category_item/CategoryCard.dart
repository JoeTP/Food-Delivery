import 'package:daythree/core/widgets/CText.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/Colors.dart';
import 'Styles.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String image;

  CategoryCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
            boxShadow: containerShadow,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset("assets/images/$image.png"),
          ),
        ),
        SizedBox(height: 8),
        CText(title),
      ],
    );
  }
}
