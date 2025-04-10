import 'package:flutter/material.dart';

import '../../../../core/constants/values.dart';
import '../../../../core/widgets/MyBackButton.dart';

class AuthTopImage extends StatelessWidget {
  final String title;
  final String desc;
  final String image;

  AuthTopImage({
    required this.title,
    required this.desc,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: mainPadding,
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyBackButton(),
          SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: 160,
            child: Text(
              desc,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
