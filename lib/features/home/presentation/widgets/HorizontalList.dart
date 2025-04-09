
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  final Widget item;
  final double height;
  const HorizontalList({
    required this.item,
    this.height = 110,
    super.key});

  @override
  Widget build(BuildContext context) =>SizedBox(
    height: height,
    child: ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 25),

      itemBuilder: (context, index) =>
      item,
      separatorBuilder: (context, index) => SizedBox(width: 8),
      scrollDirection: Axis.horizontal, itemCount: 6,
    ),
  );
}
