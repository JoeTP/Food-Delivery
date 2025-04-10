import 'package:flutter/material.dart';

class MyNetworkImage extends StatelessWidget {
  final String url;

  const MyNetworkImage(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return CircularProgressIndicator();
      },
      errorBuilder:
          (context, error, stackTrace) => Center(child: Icon(Icons.error)),
    );
  }
}
