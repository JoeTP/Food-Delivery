import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/Colors.dart';

class BottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const BottomNav({
    required this.selectedIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
      height: 60,
      decoration: BoxDecoration(
        color: blackColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavIcon(0, "home"),
          _buildNavIcon(1, "cart"),
          _buildNavIcon(2, "profile"),
          _buildNavIcon(3, "notification"),
        ],
      ),
    );
  }

  Widget _buildNavIcon(int index, String icon) {
    bool isSelected = (selectedIndex == index);
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        width: 40,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: isSelected
              ? Border(bottom: BorderSide(color: mainColor, width: 3))
              : null,
        ),
        child: SvgPicture.asset(
          "assets/images/${icon}Icon.svg",
          colorFilter: ColorFilter.mode(
            isSelected ? mainColor : greyColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}