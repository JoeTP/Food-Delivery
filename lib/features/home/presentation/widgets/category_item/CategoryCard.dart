import 'package:daythree/core/theme/Colors.dart';
import 'package:daythree/core/widgets/CText.dart';
import 'package:daythree/features/home/data/models/Categories.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/MyNetworkImage.dart';
import 'Styles.dart';

class CategoryCard extends StatelessWidget {
  final Categories categories;
  final bool isSelected;

  const CategoryCard({
    super.key,
    required this.categories,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? greenColor : Colors.transparent,

        borderRadius: BorderRadius.circular(100),
      ),
      padding: isSelected ? EdgeInsets.only(left: 6,right: 6,top: 10,bottom: 15) : EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: isSelected ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              boxShadow: isSelected ? [] : containerShadow,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: MyNetworkImage(categories.strCategoryThumb ?? ""),
            ),
          ),
          SizedBox(height: 8),
          CText(
            categories.strCategory ?? "",
            size: 12,
            weight: FontWeight.w600,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ],
      ),
    );
  }
}
