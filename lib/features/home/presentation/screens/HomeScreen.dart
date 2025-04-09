import 'package:daythree/core/widgets/CText.dart';
import 'package:flutter/material.dart';

import '../widgets/ItemDetails.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: []),
        CText("Good Afternoon!"),
        TextField(),
        Placeholder(fallbackWidth: double.maxFinite, fallbackHeight: 100),
        CText("Special Offers"),

      ],
    );
  }
}

later(context) => showModalBottomSheet(
  backgroundColor: Colors.white,
  constraints: BoxConstraints(
    maxHeight: MediaQuery.of(context).size.height * 0.85,
    minHeight: 0,
  ),
  isScrollControlled: true,
  showDragHandle: true,
  enableDrag: true,
  context: context,
  builder: (context) => AddItemToCartModalSheet(),
);
