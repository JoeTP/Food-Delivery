import 'package:daythree/core/theme/Colors.dart';
import 'package:daythree/core/widgets/CText.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;

  Header({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          CText(title, weight: FontWeight.w600, size: 18),
          Spacer(),
          TextButton(
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.resolveWith<Color?>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.pressed)) {
                  return mainColor.withValues(alpha: 0.1);
                }
                return null;
              }),
            ),
            onPressed: () {},
            child: CText("View All", color: mainColor),
          ),
        ],
      ),
    );
  }
}
