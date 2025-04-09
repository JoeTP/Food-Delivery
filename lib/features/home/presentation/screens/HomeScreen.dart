import 'package:flutter/material.dart';

import '../widgets/ItemDetails.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
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
        },
        child: Text("Press"),
      ),
    );
  }
}
